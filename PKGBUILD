# Maintainer: Chip Collier <photex@gmail.com>
# Upstream: PreSonus Audio Electronics, Inc.

# Based on PKGBUILD for https://aur.archlinux.org/packages/bitwig-studio

pkgname='studio-one-7'
pkgver='7.1.0.104182'
pkgrel='2'
pkgdesc='Digital audio workstation for music production, remixing and live performance'
arch=('x86_64')
url='https://www.presonus.com/'
license=('custom')
depends=('alsa-lib' 'egl-wayland' 'wayland' 'wayland-utils' 'libjpeg-turbo' 'icu74' 'sdbus-cpp1')
optdepends=('jack' 'pipewire' 'vulkan-icd-loader' 'vulkan-intel' 'vulkan-radeon' 'vulkan-nouveau' 'nvidia-utils')
provides=('clap-host' 'vst3-host')
replaces=()
conflicts=()
options=(!strip)
DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download \"studioone7-x86_64.deb\" manually from https://my.presonus.com')
source=('manual://studioone7-x86_64.deb')
sha256sums=('66291f27ba89df70f9de8b990afb47f79c1768afb9a6083d69f7d8046b85ccea')

package() {
  # Unpack package contents
  bsdtar -xf ${srcdir}/data.tar.gz -C ${pkgdir}/

  # Fix permissions
  chmod -R g-w ${pkgdir}/opt
  chmod -R g-w ${pkgdir}/usr

  # Create our shared extensions location (based on deb pkg postinst script)
  mkdir -p ${pkgdir}/var/opt/PreSonus/Extensions
  chmod 777 ${pkgdir}/var/opt/PreSonus
  chmod 777 ${pkgdir}/var/opt/PreSonus/Extensions
}
