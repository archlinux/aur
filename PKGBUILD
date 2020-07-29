# Maintainer: Pablo Arias <pabloariasal@gmail.com>
# Contributor: John Jenkins <twodopeshaggy@gmail.com>

pkgname=googler
pkgver=4.2
pkgrel=1
pkgdesc="Google from the command-line"
arch=('any')
url="https://github.com/jarun/googler"
license=('GPL3')
depends=('python')
conflicts=('googler-git')
source=("https://github.com/jarun/googler/archive/v$pkgver.tar.gz")
sha256sums=('ee0887ec30aea14823bb32117c97f4af8cdba381244b393665d2e273f8b60b43')

prepare() {
  cd "${pkgname}-${pkgver}"
  make disable-self-upgrade > /dev/null
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" PREFIX="/usr" install > /dev/null

  #Install autocomplete scripts
  install -Dm644 auto-completion/fish/googler.fish "${pkgdir}/usr/share/fish/vendor_completions.d/googler.fish"
  install -Dm644 auto-completion/bash/googler-completion.bash "${pkgdir}/etc/bash_completion.d/googler"
  install -Dm644 auto-completion/zsh/_googler "${pkgdir}/usr/share/zsh/site-functions/_googler"
}
