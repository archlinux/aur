# Maintainer : Daniel Bermond < gmail-com: danielbermond >
# Contributor: Cedric Girard <girard.cedric@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Asa Marco <marcoasa90[at]gmail[.]com>

pkgname=openshot-bzr
pkgver=2.4.1.r911
pkgrel=2
epoch=1
pkgdesc='An open-source, non-linear video editor for Linux based on MLT framework (bzr version)'
arch=('any')
url='https://www.openshot.org/'
license=('GPL3')
depends=('mlt-python-bindings' 'sdl' 'librsvg' 'mplayer'
         'pyxdg' 'python-pyqt5' 'python-httplib2' 'python-pillow' 'dvgrab'
         'ladspa' 'sox' 'vid.stab' 'qt5-svg' 'sdl_image'
         'libopenshot-git' 'python-pyzmq' 'qt5-webkit' 'python-setuptools'
         'python-requests')
makedepends=('bzr' 'python-setuptools')
optdepends=('frei0r-plugins: effects'
            'libquicktime' 'libavc1394' 'faac' 'jack')
provides=('openshot')
conflicts=('openshot')
source=("$pkgname"::'bzr+lp:openshot/2.0')
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    
    local _version
    local _revision
    
    _version="$(grep '^VERSION = .*' src/classes/info.py | sed 's/^VERSION = //;s/-.*$//;s/["]//g')"
    _revision="$(bzr revno)"
    
    printf '%s.r%s' "$_version" "$_revision"
}

package() {
    cd "$pkgname"
    
    python setup.py install --root="$pkgdir" --optimize='1'
}
