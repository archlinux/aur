# Maintainer: Rafael Reggiani Manzo <rr.manzo#protonmail.com>

pkgname=mycroft-core
_pkgcommit=eb0a37c
pkgver=0.7.20.${_pkgcommit}
pkgrel=1
pkgdesc="Mycroft Core, the Mycroft Artificial Intelligence platform. Contribute to this package at: https://gitlab.com/rafamanzo/aur-mycroft-core"
arch=('i686' 'x86_64')
url='https://github.com/MycroftAI/mycroft-core'
license=('GPLv3')
depends=('git'
         'python2'
         'python2-virtualenv'
         'python2-setuptools'
         'python2-gobject2'
         'python-virtualenvwrapper'
         'libtool'
         'libffi'
         'openssh'
         'autoconf'
         'bison'
         'swig'
         'glib2'
         's3cmd'
         'portaudio'
         'mpg123'
         'flac'
         'curl'
         'mimic-git'
         'alsa-utils')
makedepends=('sudo')
optdepends=()
conflicts=()
install=mycroft-core.install
# changelog=ChangeLog
# FIXME: The tarball is outdated and not able to pair with home.mycroft.ai
#source=("https://codeload.github.com/MycroftAI/mycroft-core/tar.gz/release/${pkgver}")
#sha512sums=('cd86a76b4131db1b5a172b617ee8ff46d60b8094b8dec9e3a88fe976f7d6c4d9b65b44fd62984d1ce5c8c761f15a341291677b9c1bccc50fead80727b474bca5')
source=("git://github.com/MycroftAI/mycroft-core.git#commit=${_pkgcommit}"
        "mycroft.target"
        "mycroft-service.service"
        "mycroft-skills.service"
        "mycroft-voice.service")
sha512sums=(SKIP  # Git already ensures data consistency
            a5989c9ff2b0f7338b4a6f9342c980413d71da375355abb416dce3a79e298fea7872e39b6a1505437aab860ed66755a6f344821f4f7cb31aed46792b2cef3f96
            74e9451dc38560e6efd4baf8c77cb81bdf9c0b821c1935eb2dac060614c0f14458101151583c3f444da59d9f065a744a7ad6f8daaeceec8f4e37f67d33199b6b
            cb8a5c2245ecd52e66acedebf7ce6ce8db32a84b3495d34cc3749e03aa7d12c958b5f71fa01aa79b36906401e655dd6442e979d60d53d64160d9f956551a92df
            7266494bf416a6f969bcbe9e854753e2a7e498ff9b43d6ca0ba37d94736bca9bf35f5825f24e19138428728189814222f2592fdea4c7e1d0d0ad18e7d3606a0b)

# Valid only when using a tarball
# prepare(){
#   tar xzfv "${pkgver}"
# }

# build() {}

package() {
  mkdir -p ${pkgdir}/usr/share/
  cp -R mycroft-core ${pkgdir}/usr/share/

  # Place a link to mimic where mycroft is expecting it
  mkdir -p ${pkgdir}/usr/share/mycroft-core/mimic/bin
  ln -s /usr/bin/mimic ${pkgdir}/usr/share/mycroft-core/mimic/bin/mimic

  # Symtemd units
  install -D -m644 "${srcdir}/mycroft.target" "${pkgdir}/usr/lib/systemd/user/mycroft.target"
  install -D -m644 "${srcdir}/mycroft-service.service" "${pkgdir}/usr/lib/systemd/user/mycroft-service.service"
  install -D -m644 "${srcdir}/mycroft-skills.service" "${pkgdir}/usr/lib/systemd/user/mycroft-skills.service"
  install -D -m644 "${srcdir}/mycroft-voice.service" "${pkgdir}/usr/lib/systemd/user/mycroft-voice.service"
}
