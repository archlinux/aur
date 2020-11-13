# Maintainer: bauh developers <bauh4linux@gmail.com>

pkgname=bauh-staging
pkgver=0.9.9.RC
pkgrel=2
_commit="9356c6519d178be0d748f8c0da5e6f8362765246"
pkgdesc="Graphical interface for managing your applications (AppImage, Flatpak, Snap, Arch/AUR, Web). Testing branch (it may not be working properly)."
arch=('any')
url="https://github.com/vinifmor/bauh"
license=('zlib/libpng')
depends=('python' 'python-pyqt5' 'python-pyqt5-sip' 'python-requests' 'python-colorama' 'python-pyaml' 'qt5-svg')
optdepends=('flatpak: required for Flatpak support' 
            'snapd: required for Snap support'
            'python-beautifulsoup4: for Native Web applications support'
            'python-lxml: for Native Web applications support'
            'sqlite3: required for AppImage support'
            'wget: required for AppImage and AUR support'
            'fuse2: may be required for AppImage support'
            'fuse3: may be required for AppImage support'
            'pacman: required for AUR support'             
            'binutils: required for AUR support'
            'git: to allow AUR packages downgrading'            
            'autoconf: may be required to compile some AUR packages'
            'automake: may be required to compile some AUR packages'
            'bison: may be required to compile some AUR packages'
            'fakeroot: may be required to compile some AUR packages'
            'flex: may be required to compile some AUR packages'
            'gcc: may be required to compile some AUR packages'
            'm4: may be required to compile some AUR packages'
            'lib32-fakeroot: may be required to compile some AUR packages'
            'make: may be required to compile some AUR packages'
            'patch: may be required to compile some AUR packages'
            'pkgconf: may be required to compile some AUR packages'            
            'ccache: can improve AUR packages compilation speed' 
            'aria2: multi-threaded downloading support'
            'breeze: KDE Plasma main theme'
            'axel: multi-threaded downloading support')
makedepends=('git' 'python' 'python-pip' 'python-setuptools')
provides=("bauh")
conflicts=('bauh')
source=("${url}/archive/${_commit}.tar.gz")
sha512sums=('dde2d2e471f2cbf3a52f4f6dbac74e14f6086c7721dc10380a27fc1a95965ac1bea16d145ef5aff682d19d383245831feb1c25a13a4b916cf265ab7bb10e837f')

build() {
  cd "${srcdir}/bauh-${_commit}"
  python3 setup.py build
  python3 setup.py test || return 1
}

package() {
  cd "${srcdir}/bauh-${_commit}"  
  python3 setup.py install --root="$pkgdir" --optimize=1 || return 1
  
  mkdir -p $pkgdir/usr/share/icons/hicolor/scalable/apps

  cp bauh/view/resources/img/logo.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/bauh.svg
 
  mkdir -p $pkgdir/usr/share/applications
  mv bauh/desktop/bauh.desktop $pkgdir/usr/share/applications/
  mv bauh/desktop/bauh_tray.desktop $pkgdir/usr/share/applications/
}
