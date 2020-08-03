# Maintainer: Ilya Ovchinnikov <evilbunny.x@gmail.com>

pkgname=tomatenquark
pkgver=0.2.1
pkgrel=1
pkgdesc="FPS that uses an improved version of the Cube engine"
arch=('x86_64')
url="https://tomatenquark.org/"
license=('ZLIB')
makedepends=('sdl_mixer' 'sdl_image' 'mesa-libgl' 'glu')
backup=('etc/conf.d/tomatenquark')
source=(https://github.com/${pkgname}/code/releases/download/v${pkgver}/${pkgname}_ubuntu.zip
        tomatenquark-client
        tomatenquark-server
        tomatenquark.confd
        tomatenquark.png
        tomatenquark.service
        tomatenquark.sysusers
        tomatenquark.desktop
        license.txt
)

md5sums=('e0604e4576fa33f0a947cbc3ff3c67f4'
         '05d9b7ebc5732edff1e741e8b042f808'
         'db6466d1bec9040bd34d43309fee02d1'
         '42f0f33fcefbe6626d33adcb5a0b702c'
         '9db39b41bcb2e4f187665c0f13ce1525'
         '06eae4fe31d049e3757e6d823887639c'
         '77f682a75e5b8ea2a5744cda38d7e020'
         '7eba38349fe655cba142d412caf61a9c'
         '814c1191b0b8b79054db7f5447ccc05b')

depends=('sdl2' 'sdl2_mixer' 'sdl2_image' 'curl')

package() {
  cd "${srcdir}"

  install -d "${pkgdir}"/opt/tomatenquark
  cp -r data "${pkgdir}"/opt/tomatenquark
  cp -r packages "${pkgdir}"/opt/tomatenquark
  cp -r server-init.cfg "${pkgdir}"/opt/tomatenquark

  install -D bin_unix/linux_64_client "${pkgdir}"/opt/tomatenquark/bin/linux_client
  install -D bin_unix/linux_64_server "${pkgdir}"/opt/tomatenquark/bin/linux_server
  install -Dm755 "${srcdir}"/tomatenquark-client "${pkgdir}"/usr/bin/tomatenquark-client
  install -Dm755 "${srcdir}"/tomatenquark-server "${pkgdir}"/usr/bin/tomatenquark-server
  install -Dm644 "${srcdir}"/tomatenquark.confd "${pkgdir}"/etc/conf.d/tomatenquark
  install -Dm644 "${srcdir}"/tomatenquark.service "${pkgdir}"/usr/lib/systemd/system/tomatenquark.service
  install -Dm644 "${srcdir}"/tomatenquark.sysusers "${pkgdir}"/usr/lib/sysusers.d/tomatenquark.conf
  install -Dm644 "${srcdir}"/tomatenquark.desktop "${pkgdir}"/usr/share/applications/tomatenquark.desktop
  install -Dm644 "${srcdir}"/tomatenquark.png "${pkgdir}"/usr/share/pixmaps/tomatenquark.png
  install -Dm644 "${srcdir}"/license.txt "${pkgdir}"/usr/share/licenses/tomatenquark/license.txt
}
