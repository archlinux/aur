# Maintainer: Aaron Fischer <mail@aaron-fischher.net>
# Contributor: Ryan Owens <ryanowens@linux.com>

pkgname=arduino-studio
pkgver=0.0.5
pkgrel=1
pkgdesc='Open source development environment for the Arduino Programming Language from the Arduino.org Labs.'
arch=('i686' 'x86_64')
url='http://labs.arduino.org/Arduino+Studio'
license=('CUSTOM')
depends=('libudev.so.0' 'libgcrypt15')
options=('!strip')

source=("http://download.arduino.org/studio/bundle/$pkgver/arduinostudio-$pkgver-linux32.tar.xz"
        'start.sh')
md5sums=('4aaafe10001baa230ab7b6ad36f27c0c'
         '6d11582f8e12d79e1f09ff017d299f4c')

if [ "$CARCH" == "x6_64" ]; then
  source_x86_64=("http://download.arduino.org/studio/bundle/$pkgver/arduinostudio-$pkgver-linux64.tar.xz"
                 'start.sh')
  md5sums_x86_64=('8f3f2b0689ec73c655e3890a06fa9b1a'
                  '6d11582f8e12d79e1f09ff017d299f4c')
fi

package() {
  cd "${srcdir}/arduinostudio"

  mkdir -p "${pkgdir}/usr/share/applications/"
  install -Dm644 "arduinostudio.desktop" "${pkgdir}/usr/share/applications/"

  mkdir -p "${pkgdir}/opt/arduino-studio"
  cp -r * "${pkgdir}/opt/arduino-studio/"

  # TODO: Clean up the folder from stuff which comes with other pakages

  install -Dm755 "${srcdir}/start.sh" "${pkgdir}/usr/bin/arduinostudio"
}
