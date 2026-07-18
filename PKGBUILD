# Maintainer: Arnav Gupta <allenarnav2023@gmail.com>
pkgname=soundkeeper-linux
pkgver=1.0.0
pkgrel=1 # Bumped to 2 since we are updating the package configuration
pkgdesc="Keeps audio devices alive by playing an inaudible 19kHz tone via SoX."
arch=('any')
url="https://github.com/arnav4o4/soundkeeper-linux"
license=('MIT')
depends=('sox')

# 1. Added "soundkeeper.service" to the source array so it pulls from your AUR git folder
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
  "soundkeeper.service")
sha256sums=('2146ea5c27f7ba0e44a15aaffdd109056a06708aaa6617bc7293d883d193fa45'
            'a6ccc7d9ea0ea384b6a8c56d15703b05d8747e53f114210e3f60bb56de24d524')

package() {
  # 2. Install the service file directly from the main build source directory ($srcdir)
  install -Dm644 "${srcdir}/soundkeeper.service" "${pkgdir}/usr/lib/systemd/user/soundkeeper.service"

  # 3. Step into the extracted GitHub archive to install your main files
  cd "${srcdir}/${pkgname}-${pkgver}"

  # TODO: If you have a script or binary (like soundkeeper.sh), install it to /usr/bin/ here:
  # install -Dm755 soundkeeper.sh "${pkgdir}/usr/bin/soundkeeper"
}
