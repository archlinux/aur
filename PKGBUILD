# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-security-privacy-git
pkgver=r459.bf411fc
pkgrel=1
pkgdesc='Switchboard Security & Privacy Plug'
arch=('x86_64')
url='https://launchpad.net/switchboard-plug-security-privacy'
license=('GPL3')
depends=('glib2' 'glibc' 'gtk3' 'libgee' 'light-locker'
         'pantheon-dpms-helper-bzr' 'polkit' 'ufw' 'zeitgeist'
         'libgranite.so' 'libswitchboard-2.0.so')
makedepends=('cmake' 'git' 'granite-git' 'switchboard-git' 'vala')
provides=('switchboard-plug-security-privacy')
conflicts=('switchboard-plug-security-privacy')
replaces=('switchboard-plug-security-privacy-bzr')
source=('git+https://github.com/elementary/switchboard-plug-security-privacy.git')
sha256sums=('SKIP')

pkgver() {
  cd switchboard-plug-security-privacy

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd switchboard-plug-security-privacy

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd switchboard-plug-security-privacy/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib'
  make
}

package() {
  cd switchboard-plug-security-privacy/build

  make DESTDIR="${pkgdir}" install

  chmod 755 "${pkgdir}"/usr/lib/switchboard/personal/pantheon-security-privacy/security-privacy-plug-helper
}

# vim: ts=2 sw=2 et:
