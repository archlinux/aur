# Maintainer: levinit <levinit@github.com>

pkgname=fortune-mod-zh-gushici
pkgver=1.0.0
pkgrel=2
pkgdesc="Chinese poems for fortune-mod。用于fortune的中文古詩詞，收錄傳世經典詩詞、辭賦、駢文與富有韻律的短篇散文"
arch=(any)
url="https://github.com/levinit/fortune-zh-gushici"
license=('custom:public-domain')
depends=('fortune-mod')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/levinit/fortune-zh-gushici/archive/refs/heads/main.tar.gz"
	"$pkgname.install")
sha256sums=('fe444fa227d09634d7b1ae7e770a40e9374db1081c8a9cc4d0c61d1df00c3701'
            'e0ed51b55622d33ce608f5ef17d4908349fb744b38795ab8f31642c9e9b0f010')

package() {
	cd "$srcdir/fortune-zh-gushici-main"

        # 先生成索引,再复制到安装目录(格式隨 fortune 版本而異,用當前系統的 strfile)
        strfile -c % data/gushici-cht data/gushici-cht.dat
        strfile -c % data/gushici-chs data/gushici-chs.dat

        install -d "$pkgdir/usr/share/fortune"
        install -m644 data/gushici-cht data/gushici-cht.dat "$pkgdir/usr/share/fortune/"
        install -m644 data/gushici-chs data/gushici-chs.dat "$pkgdir/usr/share/fortune/"
}
