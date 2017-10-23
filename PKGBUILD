# Maintainer: Bartłomiej Kamiński <bartlomiej.kaminski@maidsafe.net>
pkgname=web-hosting-manager
pkgver=0.4.1
pkgrel=1
pkgdesc="A tutorial app showcasing how to create and manage web services for Public ID on SAFE Network."
arch=('i686' 'x86_64')
url="https://github.com/maidsafe/safe_examples"
license=('GPL3')
groups=('maidsafe')
depends=('safe-browser')
makedepends=('nvm' 'yarn')
optdepends=()
install=
changelog=
source=('https://github.com/maidsafe/safe_examples/archive/alpha-2.tar.gz')
md5sums=('9f2fd11606650443355a3641e8ba8cd6')

build() {
  # use nvm
  . /usr/share/nvm/nvm.sh

  # prepare nvm dir
  mkdir -p $HOME/.nvm-tmp
  export NVM_DIR=$HOME/.nvm-tmp
  nvm install 7.10.0

  # load dependencies for safe-browser
  cd "safe_examples-alpha-2/web_hosting_manager"
  yarn
  yarn run package

  nvm unload
  rm -rf $HOME/.nvm-tmp
}

package() {
  cd "safe_examples-alpha-2/web_hosting_manager/release"
  mkdir -p "$pkgdir/opt/maidsafe"
  mkdir -p "$pkgdir/usr/bin"
  mv linux-unpacked "$pkgdir/opt/maidsafe/$pkgname-$pkgver"
  ln -s "/opt/maidsafe/$pkgname-$pkgver/web-hosting-manager" "$pkgdir/usr/bin/web-hosting-manager"
}
