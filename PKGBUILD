# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=Moodle-Downloader-2
pkgname=moodle-dl
pkgver=2.2.1.9
pkgrel=1
pkgdesc='A Moodle downloader that downloads course content fast from Moodle (eg. lecture pdfs)'
arch=('any')
url='https://github.com/C0D3D3V/Moodle-Downloader-2'
license=('GPL3')
depends=('ffmpeg'
         'python'
         'python-aioxmpp'
         'python-certifi'
         'python-colorama'
         'python-html2text'
         'python-requests'
         'python-sentry_sdk'
         'yt-dlp')
makedepends=('python-build' 'python-installer' 'python-wheel')
conflicts=('moodle-dl-git')
provides=('moodle-dl')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('SKIP')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
