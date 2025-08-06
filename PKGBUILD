# Contributor: Mátyás Mustoha 
# Maintainer: Aryan Ghasemi <gnuphile at telegram>

pkgname='supermariowar-bin'
_pkgname='supermariowar'
pkgdesc="Super Mario War multiplayer game."
pkgver='2025.06.18'
_pkgver="${pkgver//./-}"
pkgrel=1
arch=('x86_64')
url='https://github.com/mmatyas/supermariowar'
license=('GPL')
depends=('sdl2_image' 'sdl2_mixer' 'sdl2' 'zlib' 'hicolor-icon-theme' )
makedepends=('zip' 'tar')
provides=('smw' 'smw-server' 'smw-leveledit' 'smw-worldedit')
conflicts=('smw-git')
source=( 
"${_pkgname}-${pkgver}.zip::${url}/releases/download/continuous/${_pkgname}_${_pkgver}_linux.zip"
"icons.tar.gz"
)
install="${_pkgname}.install"
noextract=( 'icons.tar.gz' )
sha256sums=('9607b54e9be71d525d3dd36ec7076fddf693991ae8cb623a7a993673d251a49f'
            'd92e0c1390e45a09f5c3a56d23d44cd6723cd4cb81fefac33a783acc79301bbc')

package() {
  cd "$_pkgname"

#documentation and how-to-play
  install -D -m644 readme-v1.8.html "${pkgdir}/usr/share/doc/smw/readme-v1.8.html" 

#game data
  mkdir -p "${pkgdir}/var/lib/${_pkgname}/"
  cp -r data/* "${pkgdir}/var/lib/${_pkgname}/"

#binaries
  install -D -m755 smw smw-leveledit smw-server	smw-worldedit -t "${pkgdir}/usr/bin/"

#icons and .desktop files
  tar xf "${srcdir}/icons.tar.gz" -C "${pkgdir}"
# Reset ownership to root:root
  find "${pkgdir}/usr/share/" -type f -exec chown root:root {} \;
}

