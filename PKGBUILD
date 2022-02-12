# Maintainer: robertfoster

pkgname=python-rtmixer
pkgver=0.1.4
pkgrel=1
pkgdesc="Reliable low-latency audio playback and recording with Python"
arch=(any)
url="https://github.com/spatialaudio/python-rtmixer"
license=('MIT')
makedepends=('python-cffi' 'python-pip' 'python-setuptools' 'portaudio')
source=("https://github.com/spatialaudio/python-rtmixer/archive/${pkgver}.tar.gz"
  "pa_ringbuffer.c::https://app.assembla.com/spaces/portaudio/git/source/master/src/common/pa_ringbuffer.c?_format=raw"
  "pa_ringbuffer.h::https://app.assembla.com/spaces/portaudio/git/source/master/src/common/pa_ringbuffer.h?_format=raw"
  "pa_memorybarrier.h::https://app.assembla.com/spaces/portaudio/git/source/master/src/common/pa_memorybarrier.h?_format=raw")

prepare() {
  cd ${pkgname}-${pkgver}
  mkdir -p portaudio/src/common
  cp ../pa_* portaudio/src/common
}

build() {
  cd ${pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${pkgname}-${pkgver}
  python setup.py install --root="$pkgdir" --skip-build
}

sha256sums=('aaadc1a2ae68a45ff332c7e62ddf1e68f2a6ab777015c249ae81940eafd27a0c'
            '39048031099f7d72fe2175408aa5b635398dd1c604b423963bb719412f6ec5ed'
            'c43718bf0dd28b2ec2f331228c6d0b1df1f3f310a2ca36200990062b6ce59f66'
            'a0cdafd4f851aa0bfecadbf9464ac0f5cc63c15867e4437aab904135be1342b0')
