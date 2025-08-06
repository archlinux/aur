pkgname=apollo-studio
pkgver=1.8.16
pkgrel=6
pkgdesc="Apollo Studio - standalone editor and live playback engine for Launchpad light effects"
arch=('x86_64')
url="https://github.com/Jacobeagle/apollo-studio/"
license=('custom')
depends=('openssl-1.1' 'dotnet-sdk-5.0-bin')
makedepends=()
source=("https://github.com/Jacobeagle/apollo-studio/releases/download/${pkgver}/apollo-${pkgver}-linux.tar.gz"
"apollo-studio.install")
sha256sums=('9139fff4b9ac48fb9dc4a1504a451db5b90cac6af00758c3251e54dd5925fedb'
            '7d278f2bd130c2b252d5c09aaec752567ebdcbfe3393e06735ef96569f9aca4f')
options=('!strip')

install=apollo-studio.install

package() {
  # Tworzymy katalog docelowy w /opt i kopiujemy tam cały folder apollo-studio z rozpakowanego srcdir
  install -dm755 "$pkgdir/opt"
  cp -rT "${srcdir}/apollo-studio" "$pkgdir/opt/apollo-studio"

  # Instalujemy plik desktop (menu)
  install -Dm644 "${srcdir}/apollo-launchpad.desktop" "$pkgdir/usr/share/applications/apollo-launchpad.desktop"

  # Instalujemy plik MIME
  install -Dm644 "${srcdir}/application-x-approj.xml" "$pkgdir/usr/share/mime/packages/application-x-approj.xml"

  # Install wrapper script for proper launch
  install -Dm755 "${srcdir}/apollostudio" "${pkgdir}/usr/bin/apollo-studio"

}

