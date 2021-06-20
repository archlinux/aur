# Maintainer: taotieren <admin@taotieren.com>

pkgname=at32-iap-programer-mono
pkgver=v1.2.6
pkgrel=1
pkgdesc="AT32 IAP Programmer (Developed with C#, based on dotnet 4.0)"
arch=('any')
url="https://bbs.21ic.com/icview-3128878-1-1.html"
license=('unkown')
provides=(${pkgname})
conflicts=(${pkgname}  ${pkgname}-git)
replaces=(${pkgname})
depends=('mono')
makedepends=('unarchiver')
backup=()
options=('!strip')
#install=${pkgname}.install
source=("${pkgname}-${pkgver}.rar::http://bbs.21ic.com/forum.php?mod=attachment&aid=MTY2Njg4NHw3MmMxOGYxOHwxNjI0MTg3MzYwfDE3MTY4ODR8MzEyODg3OA%3D%3D")
sha256sums=('bab02636e5875ee66df39fd7c1f37acc4ef0a591a4ad201ff29848eb9230bd02')
noextract=("${pkgname}-${pkgver}.rar")

build() {
    unar -e GBK "${srcdir}/${pkgname}-${pkgver}.rar"
    cd "${srcdir}/IAP_Programmer_Console"
    xbuild IAP_Programmer_Console.sln
}

package() {
    cd "${srcdir}/IAP_Programmer_Console/IAP_Programmer_Console/bin/Debug/"
    install -Dm0755 IAP_Programmer_Console.exe "${pkgdir}/opt/AT32/${pkgname}/${pkgname%-mono}.exe"
    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname%-mono}" << EOF
#!/bin/bash
mono /opt/AT32/at32-iap-programer-mono/at32-iap-programer.exe "\$@"
EOF
}
