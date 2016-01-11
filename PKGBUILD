# Contributor: Gen2ly         <toddrpartridge@gmail.com>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Nathan Owe     <ndowens04 at gmail>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=arachnophilia
_pkgname=Arachnophilia
pkgver=5.5.2914
pkgrel=1
pkgdesc="A web page development workshop and general programming tool"
arch=('any')
url="http://www.arachnoid.com/arachnophilia/index.php"
license=('LGPL' 'custom:careware')
depends=('java-environment' 'bash' 'desktop-file-utils')
makedepends=('curl')
install=$pkgname.install
source=("http://www.arachnoid.com/$pkgname/$_pkgname.jar"
        "http://www.arachnoid.com/lutusp/old_articles/careware.rtf"
	"http://www.arachnoid.com/arachnophilia/index.php"
        "${pkgname}.desktop"
        "${pkgname}.sh")
md5sums=('655fa3322d93900ca2cf7e78e90968af'
         'b2c3dc9852bff89756c89f957089374f'
         '13091becf6c42c91765f606875754d0e'
         'a41385032fe3a726321d02cd85f9ba55'
         '27010dd0f2b690ca78392dffcc25f210')
DLAGENTS=('http::/usr/bin/curl -A "Mozilla/4.0" -fLC - --retry 3 --retry-delay 3 -o %o %u')
noextract=("$_pkgname.jar")

pkgver() {
  echo $(awk '/Current/ {print $4 $6}' $srcdir/index.php|tr , .)
}

package() {
  cd "${srcdir}"

  # Install program files
  install -Dm755 ${pkgname}.sh "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 $_pkgname.jar "${pkgdir}/usr/share/${pkgname}/$_pkgname.jar"

  # Install a desktop entry
  bsdtar -xf Arachnophilia.jar Arachnophilia.png
  install -Dm644 Arachnophilia.png  "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 ${pkgname}.desktop \
   "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install a license file
  install -Dm644 careware.rtf \
   "${pkgdir}/usr/share/licenses/${pkgname}/careware.rtf"
}
