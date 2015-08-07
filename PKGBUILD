# Maintainer: Aaron Fischer <mail@aaron-fischher.net>

pkgname=arduino-studio
pkgver=0.0.2
pkgrel=1
pkgdesc='Open source development environment for the Arduino Programming Language from the Arduino.org Labs.'
arch=("i686" "x86_64")
url='http://labs.arduino.org/Arduino+Studio'
license=('CUSTOM')
depends=('libudev.so.0')
options=("!strip")

source=("http://download.arduino.org/studio/bundle/$pkgver/arduinostudio-$pkgver-linux32.tar.xz"
        "start.sh")
md5sums=("6b91a9989ab21c4fa3ca0b26dd2f5788"
         "6d11582f8e12d79e1f09ff017d299f4c")

if [ "$CARCH" == "x86_64" ]; then
  source=("http://download.arduino.org/studio/bundle/$pkgver/arduinostudio-$pkgver-linux64.tar.xz"
          "start.sh")
  md5sums=("eab1e382447f8b950b6f42577ad31492"
           "6d11582f8e12d79e1f09ff017d299f4c")
fi

package() {
  BASEDIR="${srcdir}/arduinostudio-${pkgver}-linux32"
  if [ "$CARCH" == "x86_64" ]; then
    BASEDIR="${srcdir}/arduinostudio-${pkgver}-linux64"
  fi
  cd "${BASEDIR}"

  # TODO: Desktop Icon

  mkdir -p "${pkgdir}/opt/arduino-studio"
  cp -r * "${pkgdir}/opt/arduino-studio/"
  # TODO: Clean up the folder from stuff the user dont need

  install -Dm755 "${srcdir}/start.sh" "${pkgdir}/usr/bin/arduino-studio"
}

