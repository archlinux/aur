# Maintainer: Sean Haugh <seanphaugh@gmail.com>
# Contributor: Frederik "Freso" S. Olesen <freso.dk@gmail.com>
# Contributor: Trygve Aaberge <trygveaa+aur at gmail dot com>
_pkgname=mopidy
_owner=mopidy
pkgname=mopidy-git
pkgver=2.1.0.r57.g79d42c34
pkgrel=1
pkgdesc='An extensible music server written in Python'
arch=('any')
url="https://github.com/$_owner/$_pkgname"
license=('APACHE')
depends=('python2'
	'python2-pykka'
	'python2-requests'
	'python2-tornado'
	'gst-python2'
	'gst-plugins-base'
	'gst-plugins-good'
	'gst-plugins-ugly')
makedepends=('git'
	'python2-setuptools')
optdepends=('gst-libav: AAC+ and WMA support'
	'mopidy-spotify: Spotify backend'
	'mopidy-scrobbler: Last.FM scrobbler'
	'mopidy-mpris: MPRIS frontend')
provides=("$_pkgname=$pkgver-$pkgrel")
conflicts=('mopidy')
source=("git+https://github.com/$_owner/$_pkgname"
	'mopidy@.service'
	'mopidy-user.service')
md5sums=('SKIP'
	'cdda1474b91b1e35a909e93fc8305599'
	'81de34714bf80d638df34fc3469bd3f5')

pkgver() {
	cd "$_pkgname"
	git describe --long | sed -r 's/^v//; s/([^-]*-g)/r\1/; s/-/./g'
}

package() {
	cd "$_pkgname"
	python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
	install -Dm644 "$srcdir/mopidy@.service" "$pkgdir/usr/lib/systemd/system/mopidy@.service"
	install -Dm644 "$srcdir/mopidy-user.service" "$pkgdir/usr/lib/systemd/user/mopidy.service"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim: set ts=2 sw=2 noet:
