# Maintainer: max-k <max-kATpostDOTcom>

pkgname=heketi-client
_pname=${pkgname%%-client}
_shortname=${_pname}-cli
pkgver=8.0.0
pkgrel=2
pkgdesc="RESTful based volume management framework for GlusterFS (client)"
arch=('x86_64')
url="https://github.com/heketi/heketi"
license=('APACHE' 'GPL2')
depends=('glibc')
source=("https://github.com/$_pname/$_pname/releases/download/v$pkgver/$pkgname-v$pkgver.linux.amd64.tar.gz")
sha256sums=('72505efee7064c005dac59006aac8af4c4ae17ca7b4129271723add1cf43e149')

build() {
    echo > /dev/null
}

package() {
    cd "$srcdir"/"$pkgname" || exit 1
    install -dm755 "$pkgdir"/usr/{bin,share}
    install -dm755 "$pkgdir"/usr/share/"$pkgname"/{kubernetes,openshift}
    install -dm755 "$pkgdir"/usr/share/"$pkgname"/openshift/templates
    install -m755 bin/"$_shortname" "$pkgdir"/usr/bin/"$_shortname"
    for target in kubernetes openshift; do
        [[ "$target" == "openshift" ]] && tpl="templates/"
        install -m755 share/"$_pname"/"$target"/"$tpl"* \
            "$pkgdir"/usr/share/"$pkgname"/"$target"/"$tpl"
    done
}
