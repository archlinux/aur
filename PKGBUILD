# Maintainer: yaroslav <proninyaroslav@mail.ru>
# Contributor: Ivan Petruk <localizator at ukr dot net>

pkgname=vkaudiosaver
_realname=VkAudioSaver
pkgver=1.5.1
pkgrel=2
pkgdesc="A tool for listening & downloading the music from social network VK.COM"
arch=('i686' 'x86_64')
url="http://vkaudiosaver.ru/"
license=('GPL3')
groups=("network")

if [ "$CARCH" = "i686" ]; then
    _arch='i386'
    depends=('fontconfig' 'freetype2' 'libstdc++5' 'libx11' 'libxext' 'libxrender' 'zlib' 'libpng12')
    source=("http://bingosoft.info/filez/vkaudiosaver-${pkgver}-${_arch}.deb"
            "vkaudiosaver.desktop")
    sha256sums=('98073b82c0e65457bc549cfd71b278d8dfc4eb1ff80fd89449d8f5013d6aeb7f'
                'afed971e597cc4d4c3170284e52a80115ffa8afd630fbb806c831413a3177994')
elif [ "$CARCH" = "x86_64" ]; then
    _arch='amd64'
    depends=('fontconfig' 'freetype2' 'libstdc++5' 'libx11' 'libxext' 'libxrender' 'zlib' 'libpng12'
             'lib32-fontconfig' 'lib32-freetype2' 'lib32-libxext' 'lib32-zlib' 'lib32-gcc-libs' 'lib32-libxrandr' 'lib32-libstdc++5' 'lib32-libpng12')
    source=("http://bingosoft.info/filez/vkaudiosaver-${pkgver}-${_arch}.deb"
            "vkaudiosaver.desktop")
    sha256sums=('b045990c42dd8742369e8155f3f7f01265dd4513affd2e2c6fa0ca6694a58b61'
                'afed971e597cc4d4c3170284e52a80115ffa8afd630fbb806c831413a3177994')
fi

package() {

  msg "Preparing install"
  mkdir -p ${pkgdir}/usr/{bin,share}
  mkdir -p ${pkgdir}/usr/share/pixmaps
  ar x ${srcdir}/vkaudiosaver-${pkgver}-${_arch}.deb
  tar xvzf ${srcdir}/data.tar.gz
  msg2 "Done preparing!"

  msg "Actual installation"
  cp -dpr --no-preserve=ownership ${srcdir}/{opt,usr} ${pkgdir}
  rm ${pkgdir}/usr/share/applications/${pkgname}.desktop
  cp ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications
  ln -s "/opt/$_realname/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  ln -s "/opt/$_realname/icon64.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  msg2 "Installation finished!"

}