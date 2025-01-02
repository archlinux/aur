# Maintainer: Mark Vainomaa <mikroskeem@mikroskeem.eu>

pkgname='openarena'
pkgver='0.8.8'
pkgrel='4'
pkgdesc="A violent, sexy, multiplayer first person shooter based on the ioquake3 engine (binary package)"
arch=('i686' 'x86_64')
url="http://openarena.ws/"
license=('GPL')
depends=('sdl' 'libvorbis' 'curl')
optdepends=('openal: to silence SDL fallback warning')
source=("openarena-${pkgver}.zip::https://sourceforge.net/projects/oarena/files/openarena-${pkgver}.zip/download"
        'openarena-runner.sh'
        'openarena.png'
        'openarena-server.png'
        'openarena.desktop'
        'openarena-server.desktop')
sha512sums=('9fa4dabe8a3428dc3cbec97f3b4d20c04569c14cdd00b60e6391c6dd61e310f246ff5ec97e7549821b3d6f5f94b140eb5411a2ddd83dafcad66937b7f78ea8dd'
            'caf730b33f2ce3f997a533a34f3da4517bf4c114f97a11e7b462f10b65a9252f48d5d6ff7ee5592a4abb42b356c8784299440eb1b80cd4d269debc6568282881'
            'ef68f8eb6251c3424464702ff894a6b88b473a3f4c1512af613125f5e5a7124f268490a9f6042095ff5bb807817e1f302c80d21987a2ed178e680f993d70b6f1'
            '9e8c860fe8e9a6fefa9839907df6e74f11564daaa2bf12b4c261dec34d65917e7110a41aa7777f16d3842c8371b9e960468d75c439d8b815454feeb8c01ed6e6'
            '5acd934f451559ad68b76a4de4b132b9ead9542dd078df7c7489ce2b2774557d81c6405622e8090ced2ace5f05165af1ed5dee8674d3fef725cd633727c92538'
            '426734a1517802b00b062006fcac4e321b4bf2fa8f3a3f7670a11ae62cf6cdd417bd158d0d613c0017e44e5a9528d72ef77e383a4fda2b230f0cc0f8ef9185d1')

build() {
  cd "${srcdir}/openarena-${pkgver}"
  rm *.dll *.exe
  rm -rf __MACOSX *.app
}

package() {
  output="${pkgdir}/opt"
  install -dm755 "${output}" "$pkgdir"/usr/share/pixmaps/ "$pkgdir"/usr/share/applications/ "$pkgdir"/usr/bin
  mv "${srcdir}/openarena-${pkgver}" "${pkgdir}/opt/openarena"
  find "${pkgdir}/opt/openarena" -type f -exec chmod 644 {} \;
  find "${pkgdir}/opt/openarena" -type d -exec chmod 755 {} \;
  chmod 755 "${pkgdir}"/opt/openarena/*.{i386,x86_64}

  install -Dm 644 "$srcdir"/openarena{,-server}.png "$pkgdir"/usr/share/pixmaps/
  install -Dm 644 "$srcdir"/openarena{,-server}.desktop "$pkgdir"/usr/share/applications/

  install -Dm 755 "$srcdir"/openarena-runner.sh "$pkgdir"/opt/openarena/openarena-runner.sh
  ln -s /opt/openarena/openarena-runner.sh "$pkgdir"/usr/bin/openarena
  ln -s /opt/openarena/openarena-runner.sh "$pkgdir"/usr/bin/openarena-server
}
