# Maintainer: Martynas Mickevičius <self at 2m dot lt>
pkgname=ucm-bin
pkgver=M5d
pkgrel=2
pkgdesc='Unison language code manager'
arch=('x86_64')
url='https://www.unison-lang.org/'
license=('custom')
depends=('gmp' 'zlib')

source=("ucm-$pkgver::https://github.com/unisonweb/unison/releases/download/release%2F$pkgver/ucm-linux.tar.gz"
        "https://raw.githubusercontent.com/unisonweb/unison/release/$pkgver/LICENSE")
sha256sums=('b239d3ccf0d3923f1cb7a2623ab43fc1e7bdc8695bf57a950ec5d75c03ed66a0'
            'cbcdbf3fd38b10578a384fdfa53f498ceb66bc34af6c3c705577aa68afffc4ac')

package() {
  install -D -m755 ucm "$pkgdir/usr/share/ucm/ucm"
  cp -rv "$srcdir/ui" "$pkgdir/usr/share/ucm/ui"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  mkdir -p "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/ucm" <<-EOF
	#!/bin/sh
	export UCM_WEB_UI="\${UCM_WEB_UI-/usr/share/ucm/ui}"
	exec /usr/share/ucm/ucm
	EOF
  chmod +x "${pkgdir}/usr/bin/ucm"
}
