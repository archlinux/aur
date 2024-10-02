# Maintainer: Martynas Mickevičius <self at 2m dot lt>
pkgname=ucm-bin
pkgver=0.5.27
pkgrel=1
pkgdesc='Unison language code manager'
arch=('x86_64')
url='https://www.unison-lang.org/'
license=('custom')
depends=('gmp' 'zlib')

source=("ucm-$pkgver::https://github.com/unisonweb/unison/releases/download/release%2F$pkgver/ucm-linux.tar.gz"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/unisonweb/unison/release/$pkgver/LICENSE")
sha256sums=('8ececc8332504a1cbacf540db084708ed65facd386c14034d3549694a5a03280'
            '26537a8bd08791aef2f335fd296b00023b292546b8a1b35223c11abca39cd6ed')

package() {
  install -D -m755 ucm "$pkgdir/usr/share/ucm/ucm"
  cp -rv "$srcdir/racket" "$pkgdir/usr/share/ucm/racket"
  cp -rv "$srcdir/runtime" "$pkgdir/usr/share/ucm/runtime"
  cp -rv "$srcdir/ui" "$pkgdir/usr/share/ucm/ui"
  cp -rv "$srcdir/unison" "$pkgdir/usr/share/ucm/unison"
  install -Dm644 LICENSE-$pkgver "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  mkdir -p "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/ucm" <<-EOF
	#!/bin/sh
	export UCM_WEB_UI="\${UCM_WEB_UI-/usr/share/ucm/ui}"
	exec /usr/share/ucm/ucm
	EOF
  chmod +x "${pkgdir}/usr/bin/ucm"
}
