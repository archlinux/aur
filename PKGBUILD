# Maintainer: Matthew McGinn <mamcgi@gmail.com>
pkgname=aisdeco2
pkgver=20161112
pkgrel=1
pkgdesc="Cross-Platform Console Software-defined radio (SDR) receiver/decoder for marine Automatic Information System (AIS) signals"
arch=('x86_64' 'i686' 'armv6h' 'armv7h')
url="http://xdeco.org/"
license=('MIT')
depends=('rtl-sdr')
provides=('aisdeco2')

prepare() {
	case "$CARCH" in
		armv6h|armv7h)	_source_bin=("aisdeco_rpi_20140704.tgz")
				;;
		i686) _source_bin=("aisdeco2_"$CARCH"_20150415.tgz")
				;;
		x86_64) _source_bin=("aisdeco2_"$CARCH"_20161112.tgz")
				;;
	esac
	curl -sL "https://github.com/xginn8/aisdeco/blob/master/$_source_bin?raw=true" | tar xz
}

package() {
	install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm755 "$srcdir/LICENSE.MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.MIT"
}

