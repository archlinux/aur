# Maintainer: Pablo Arias <pabloariasal@gmail.com>
# Contributor: John Jenkins <twodopeshaggy@gmail.com>

pkgname=googler
pkgver=4.3.2
pkgrel=1
pkgdesc="Google from the command-line"
arch=('any')
url="https://github.com/jarun/googler"
license=('GPL3')
depends=('python')
conflicts=('googler-git')
source=("https://github.com/jarun/googler/archive/v$pkgver.tar.gz")
sha256sums=('bd59af407e9a45c8a6fcbeb720790cb9eccff21dc7e184716a60e29f14c68d54')

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
