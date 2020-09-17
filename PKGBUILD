pkgname=mps-youtube-hd-git
pkgver=0.2.8.r167.g06de1d9
pkgrel=1

pkgdesc="Terminal based YouTube jukebox, fork with HD video playback"
url='https://github.com/th0rn/mps-youtube'
arch=('any')
license=('GPL3')

depends=('python' 'python-setuptools' 'python-pafy' 'mpv')
optdepends=('ffmpeg: for transcoding downloaded content'
            'python-pyperclip: for copying content to the clipboard'
            'python-gobject: MPRIS2 support'
            'python-dbus: MPRIS2 support')
makedepends=('git')

provides=('mps-youtube')
conflicts=('mps-youtube')

source=("git+${url}")

md5sums=('SKIP')

pkgver() {
    cd "${pkgname%-hd-git}"
    git describe --tags --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

package() {
    cd "${pkgname%-hd-git}"
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm 644 README.rst -t "$pkgdir/usr/share/doc/${pkgname%-hd-git}"
}
