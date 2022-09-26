# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=Moodle-Downloader-2
pkgname=moodle-dl
pkgver=2.2.2.0
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
md5sums=('e2359b70dfb21e2878ce06ade82b69a0e14a7e9ecf3ac2cf1c71e58e1cdedeef0ddd17bab677a7c96550af3bb7aedc45536f2e30f8ffcc54b3f375fffef4c7e3')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
