# Maintainer:  Foppe Hemminga <foppe@hemminga.net>

pkgname=('cmdlauncher-git')
pkgver=r76.ac02c7d_1
pkgrel=1
pkgdesc='A project aimed at help people launch a command in a graphical way.'
url='https://github.com/xuhdev/cmdlauncher'
license=('GPL3')
source=('git+https://github.com/xuhdev/cmdlauncher.git')
sha256sums=('SKIP')
makedepends=('git'
             'cmake')
depends=('qt5-base'
         'yaml-cpp>=0.5'
         'gcc-libs-multilib')
arch=('x86_64'
      'i686')

build() {
  cd cmdlauncher

  cmake .
  make
}

package() {
  cd cmdlauncher

  # Install Documentation
  install -D -m644 README "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  # Install main executable
  install -Dm755 cmdlauncher ${pkgdir}/usr/bin/cmdlauncher

  mkdir -p ${pkgdir}/opt/cmdlauncher

  # Copy the examples to /opt/cmdlauncher
  cp -r examples ${pkgdir}/opt/cmdlauncher/

  # Copy the sample.cla to opt/cmdlancher
  cp sample.cla ${pkgdir}/opt/cmdlauncher
}

# vim:set ts=2 sw=2 et: