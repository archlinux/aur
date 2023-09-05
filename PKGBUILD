# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="cloudflare-blog-git"
pkgver=r99.a4e5420
pkgrel=1
pkgdesc="Cloudflare Blog code samples"
url="https://github.com/cloudflare/cloudflare-blog"
license=("BSD3")
arch=("any")
depends=("python")
source=("git+$url"
        "cloudflare-blog.patch")
sha256sums=('SKIP'
            '2531484eae4345a6adc57ec3fd9e54603ff10f173f83a941b88a1418edc61da7')

pkgver(){
 cd "cloudflare-blog"
 printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
 cd "cloudflare-blog"
 patch --forward --strip=1 --input="$srcdir/cloudflare-blog.patch"
}

package(){
 cd "cloudflare-blog"
 # https://blog.cloudflare.com/three-little-tools-mmsum-mmwatch-mmhistogram/
 # https://github.com/cloudflare/cloudflare-blog/tree/master/2017-06-29-ssdp
 install -D "2017-06-29-ssdp/mmhistogram" -t "$pkgdir/usr/bin"
 install -D "2017-06-29-ssdp/mmsum" -t "$pkgdir/usr/bin"
 install -D "2017-06-29-ssdp/mmwatch" -t "$pkgdir/usr/bin"
}
