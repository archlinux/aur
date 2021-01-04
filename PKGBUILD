# Maintainer: gCurse <gcurse at web de>

pkgname=otr-verwaltung3p-dev-git
pkgver=1.0.0b8.post4.r0.geabc7a3
pkgrel=1
pkgdesc='Manage your onlinetvrecorder.com files: cut, preview cuts, rate cutlists etc.'
arch=('any')
url='https://github.com/EinApfelBaum/otr-verwaltung3p'
license=('GPL3')
depends=('gtk3' 'python' 'python-gobject' 'gst-python' 'python-appdirs' 'python-psutil' 'python-cairo'
         'python-requests' 'python-keyring' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugin-gtk'
         'gst-plugins-bad' 'gst-plugins-ugly' 'gst-libav' 'mpv' 'ffmpeg' 'ffms2' 'mediainfo'
         'mkvtoolnix-cli' 'x264')
optdepends=('gnome-keyring: For password storing in keyring'
            'kwallet: For password storing in wallet'
            'mediainfo-gui: For plugin Mediainfo')
makedepends=('git' 'python-setuptools')
conflicts=('otr-verwaltung3p' 'otr-verwaltung3p-dev')
provides=('otr-verwaltung3p')
source=("git+https://github.com/EinApfelBaum/otr-verwaltung3p.git#branch=development")
sha256sums=('SKIP')
options=('!strip')

_gitname='otr-verwaltung3p'

pkgver() {
  cd "${srcdir}/${_gitname}"
  git_version=$(git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g')
  echo $git_version > data/VERSION-git
  echo $git_version
}

package() {
    cd "${srcdir}/${_gitname}"
    python setup.py install --prefix=/usr --root=${pkgdir} --optimize=1
}
