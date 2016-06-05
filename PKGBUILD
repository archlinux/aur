# Maintainer: BrLi <brli@chakraos.org>

pkgname=ttf-twcns-fonts
pkgdesc='Chinese TrueType fonts by Taiwan government, support CNS11643 standard, including Kai and Sung fontface'
pkgver=98.1
pkgrel=2
arch=('any')
url='http://www.cns11643.gov.tw/AIDB/'
depends=(freetype2 fontconfig)
makedepends=(libarchive)
source=('AIDB_soft-100-1.linux.sh::http://www.cns11643.gov.tw/AIDB/file.do?path=download/個人電腦造字處理工具`1q`Unicode平台`1q`全字庫軟體包(Linux版)/name/AIDB_soft-100-1.linux.sh'
        'LICENSE')
sha1sums=('36a7489c9bb1cb2cb7e09951617c7719ac83786b'
          'f7bd9f63e62492e0be4c7ef44916f6d5e0efbcf2')

prepare() {
    sh AIDB_soft-100-1.linux.sh || true # We don't have yum
    mkdir -p twcns-fonts && cd twcns-fonts
    bsdtar -xf ../twcns-fonts-98.1-1.noarch.rpm
}

package() {
    for dir in usr etc; do
        cp -rv ${srcdir}/twcns-fonts/${dir} ${pkgdir}/${dir}
    done
    install -Dm644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
