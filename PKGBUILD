# Maintainer:
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Sebastien Bariteau <numkem@gmail.com>
#
# i3pystatus doesn't have releases; it's rolling release.
# This package attempts to track recent stable versions, but is updated
# manually so we can check that it buidls/runs.
#
# This'll be improved at some point to be an automated process.

_pkgrev=e0234c12233903bd7faca96f2f4497fb876191f2

pkgname=i3pystatus
pkgdesc="i3status replacement written in python for the i3 window manager"
pkgver=r1807.e0234c1
pkgrel=2
arch=('i686' 'x86_64')
license=('MIT')
depends=('python')
makedepends=('git' 'python-setuptools')
optdepends=('python-pyalsaaudio: For the alsa module.',
            'python-dbus: For the thunderbird or now_playing modules.',
            'python-psutil: For the mem, membar or network_traffic modules.',
            'python-netifaces: For the network or wireless modules.',
            'python-beautifulsoup4: For the parcel module.',
            'python-cssselect: For the parcel module.',
            'python-lxml: For the parcel module.',
            'python-pywapi: For the weather module.',
            'python-basiciw: For the wireless module.'
            'python-colour: For the pulseaudio module.')
url="https://github.com/enkore/i3pystatus"
source=("git+https://github.com/enkore/i3pystatus.git#commit=$_pkgrev")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname}"
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname}"
  python setup.py install --prefix=/usr --root="$pkgdir"
  install -Dm644 MIT-LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
} 
