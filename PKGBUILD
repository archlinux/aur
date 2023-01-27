# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=Moodle-Downloader-2
pkgname=moodle-dl
pkgver=2.2.2.4
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
b2sums=('0ccd4c1657480da0172706808e8fa85c0afdc4e5c5b3b1e9dc9e2dd5ca69e96e79911ad19fa7db8c3796b0cef16e661bf3eaf7150d962b842e444d45c5b586d3')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
