# Maintainer: ramen <hendrik@hndrkk.sh>
# Contributor: Pablo Arias <pabloariasal@gmail.com>
# Contributor: John Jenkins <twodopeshaggy@gmail.com>

pkgname=googler
pkgver=4.3.12
pkgrel=1
pkgdesc="Google from the command-line"
arch=('any')
url="https://github.com/oksiquatzel/googler"
license=('GPL3')
depends=('python')
conflicts=('googler-git')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('8e1ea39d7afde497c57a628421e84d75e087bc0d5e63afd1e9bf12ba18ee0102')

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
