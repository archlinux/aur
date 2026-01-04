# Maintainer: Kyle Thompson <kylejeromethompson@gmail.com>
#
# --- DISCLAIMER ---
# This PKGBUILD is an unofficial community contribution. It is not affiliated with,
# endorsed, or supported by CrowdStrike, Inc.
#
# The CrowdStrike Falcon sensor is proprietary software. By building and installing
# this package, you acknowledge that you are downloading software directly from
# CrowdStrike and agree to be bound by their End User License Agreement and
# Privacy Notice. You are solely responsible for ensuring you have a valid
# license to use the software.
#
# This installation script is provided "AS IS" without warranty of any kind,
# express or implied. The user assumes all risk and responsibility for its use.
#
# Terms of Use: https://www.crowdstrike.com/software-terms-of-use/
# Privacy Notice: https://www.crowdstrike.com/privacy-notice/


# --- Package Information ---
pkgname='falcon-sensor'
pkgdesc="CrowdStrike Falcon Sensor for Linux"
arch=('x86_64')
url="https://falcon.crowdstrike.com/"
license=('custom')

# --- Versioning ---
_pkgver='7.32.0'
_pkgrel='18504'
pkgver=${_pkgver}
pkgrel=${_pkgrel}

# --- Dependencies and Conflicts ---
depends=('glibc' 'openssl')
provides=("${pkgname}")
conflicts=("${pkgname}")
install="${pkgname}.install"

# --- Source File ---
source=("falcon-sensor_${_pkgver}-${_pkgrel}_amd64.deb::https://socfoundry.com/downloads/falcon-sensor_${_pkgver}-${_pkgrel}_amd64.deb")
sha256sums=('0c3ac12e749647cd05a8e8bd6281541e5ba8496ca1ba042eda6637f547db5dc0')

# --- Packaging Function ---
package() {
  # Extract the data archive from the .deb file
  tar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}/"

  # Create the destination directory structure first (-p creates parent dirs if needed)
  mkdir -p "${pkgdir}/usr/lib/"

  # Move the contents of the extracted 'lib' directory to '/usr/lib' inside the package
  mv "${pkgdir}/lib"/* "${pkgdir}/usr/lib/"

  # Remove the now-empty 'lib' directory from the package
  rmdir "${pkgdir}/lib"
}
