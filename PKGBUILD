# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=Moodle-DL
pkgname=moodle-dl
pkgver=2.3.2.5
pkgrel=1
pkgdesc='A Moodle downloader that downloads course content fast from Moodle (eg. lecture pdfs)'
arch=('any')
url='https://github.com/C0D3D3V/Moodle-DL'
license=('GPL3')
depends=('ffmpeg'
         'python>=3.7'
         'python-aiodns>=3.0.0'
         'python-aiofiles>=22.1.0'
         'python-aiohttp>=3.8.4'
         'python-certifi>=2020.4.5.2'
         'python-colorama>=0.4.6'
         'python-colorlog>=6.7.0'
         'python-html2text>=2020.1.16'
         'python-readchar>=4.0.3'
         'python-requests>=2.24.0'
         'python-sentry_sdk>=0.13.5'
         'python-xmpppy>=0.7.1'
         'yt-dlp>=2021.10.22')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$url/archive/v$pkgver.tar.gz")
b2sums=('ddb946e2a38c345186c0b4b920817356896162e188164639d33acf6fabc34d7e67239a61b94e5fb6ed54a70f756c3f4b43210e0395293d14a46a193aaa0038f7')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
