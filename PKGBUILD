# Maintainer: Aaron Fischer <mail@aaron-fischher.net>
# Contributor: Ryan Owens <ryanowens@linux.com>

pkgname=arduino-studio
pkgver=0.0.4
pkgrel=1
pkgdesc='Open source development environment for the Arduino Programming Language from the Arduino.org Labs.'
arch=('i686' 'x86_64')
url='http://labs.arduino.org/Arduino+Studio'
license=('CUSTOM')
depends=('libudev.so.0' 'libgcrypt15')
options=('!strip')

source=("http://download.arduino.org/studio/bundle/$pkgver/arduinostudio-$pkgver-linux32.tar.gz"
        "start.sh")
md5sums=("a2e87948b1d8bee812d8e0d7f99e8e26"
         "6d11582f8e12d79e1f09ff017d299f4c")

if [ "$CARCH" == "x86_64" ]; then
  source_x86_64=("http://download.arduino.org/studio/bundle/$pkgver/arduinostudio-$pkgver-linux64.tar.gz"
                 "start.sh")
  md5sums_x86_64=("359b029c5c98e9d934f93479756f7ca4"
                  "6d11582f8e12d79e1f09ff017d299f4c")
fi

package() {
  BASEDIR="${srcdir}/arduinostudio"
  if [ '$CARCH' == 'x86_64' ]; then
    BASEDIR="${srcdir}/arduinostudio"
  fi
  cd "${BASEDIR}"

  mkdir -p "${pkgdir}/usr/share/applications/"
  install -Dm644 "arduinostudio.desktop" "${pkgdir}/usr/share/applications/"

  mkdir -p "${pkgdir}/opt/arduino-studio"
  cp -r * "${pkgdir}/opt/arduino-studio/"

  # TODO: Clean up the folder from stuff which comes with other pakages

  install -Dm755 "${srcdir}/start.sh" "${pkgdir}/usr/bin/arduinostudio"
}
