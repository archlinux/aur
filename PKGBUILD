# Maintainer: Thorben Guenther <echo YWRtaW5AeGVucm94Lm5ldAo= | base64 -d>

pkgname=mycroft-core
pkgver=18.2.7
pkgrel=1
pkgdesc="Mycroft Core, the Mycroft Artificial Intelligence platform."
arch=('i686' 'x86_64')
url='https://github.com/MycroftAI/mycroft-core'
license=('Apache')
depends=('git'
         'python'
         'python-pip'
         'python-virtualenv'
         'python-setuptools'
         'python-gobject2'
         'python-virtualenvwrapper'
         'libtool'
         'libffi'
         'openssl'
         'autoconf'
         'bison'
         'swig'
         'glib2'
         'portaudio'
         'mpg123'
         'screen'
         'flac'
         'curl'
         'pkg-config'
         'icu'
         'automake'
         'libjpeg-turbo'
         'mimic'
         'jq'
         'fann')
makedepends=('sudo')
optdepends=()
conflicts=()
install=mycroft-core.install
# changelog=ChangeLog
source=("https://github.com/MycroftAI/mycroft-core/archive/release/v${pkgver}.tar.gz"
        "mycroft-core.install"
        "venv_init"
        "mycroft.service")
sha512sums=('c673e331a76f6a759b1d57deb0591331899a34236c9350f32ff67fd7737b6d35ad0b3d76891ee154cffdc8132c188b06b0a7fb5e1ea3e2236ac067b0a088dac3'
            '7d387018b88974db86307edc951e347c4fd45f6929df0f5f2ea47b03aafda0f5b6335d1b742642fb5fcca08cbe20586ca2b543aaa3404f0e75bcb62914be568e'
            '6773fd4dbf852d4129a97041677311cff0c25e8b9cf1e822a8b63df6fcb16c4af1d1afc128c375488b479f1892e6173d37accf57c28a0f9ceb6e643dd906ecc6' 
            '67c228fb4a25d1ce529d1689e81703284015ab2721cecdac8264a94e1a41e629e6b6cb82566d41744ebce0d84b7e5c54156cc62c447f7b10b41e012682d0e146')

package() {
  mkdir -p ${pkgdir}/usr/share/
  cp -R mycroft-core-release-v${pkgver} ${pkgdir}/usr/share/mycroft-core
  cp venv_init ${pkgdir}/usr/share/mycroft-core

  # Place a link to mimic where mycroft is expecting it
  mkdir -p ${pkgdir}/usr/share/mycroft-core/mimic/bin
  ln -s /usr/bin/mimic ${pkgdir}/usr/share/mycroft-core/mimic/bin/mimic

  # Set permissions
  chmod -R g+w ${pkgdir}/usr/share/mycroft-core

  # Symtemd unit
  install -D -m644 "${srcdir}/mycroft.service" "${pkgdir}/usr/lib/systemd/user/mycroft.service"
}
