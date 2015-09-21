# Maintainer: Tetsumi <tetsumi@vmail.me>

pkgbase=python-pygame
pkgname=python-pygame
pkgver=1.9.1
pkgrel=1
pkgdesc="Python game library"
arch=('i686' 'x86_64')
url="http://www.pygame.org"
license=('LGPL')
depends=('python' 'sdl_mixer' 'sdl_ttf' 'sdl_image' 'portmidi')
provides=('python-pygame')

source=(http://www.pygame.org/ftp/pygame-${pkgver}release.tar.gz
	pygame-config.patch
	pygame-v4l.patch
	pygame-joystick.patch
)

sha1sums=('a45aeb0623e36ae7a1707b5f41ee6274f72ca4fa'
          '285815e28705d5a2aea53c9d952d35fddf10dd13'
          '7e693fb2ef5ef636f9965ba1a4eb854f8b0b5070'
          '399ef25b9bdcda7eb35f0147dffcfc4886405c36')

prepare() 
{
  cd pygame-${pkgver}release
  patch -p0 -i "${srcdir}/pygame-config.patch"
  patch -p1 -i "${srcdir}/pygame-v4l.patch"
  patch -p1 -i "${srcdir}/pygame-joystick.patch"
}


package() 
{
  cd pygame-${pkgver}release
  python config.py -auto
  python setup.py install --root="${pkgdir}" --prefix=/usr
}
