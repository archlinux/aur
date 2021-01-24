# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_pkgname=symbiflow-arch-defs
pkgname="$_pkgname-nightly-bin"
_buildnum=125
_builddate=20210122-000052
_commit=bff52005
pkgver="${_builddate%%-*}.$_commit"
pkgrel=1
pkgdesc="Documentation of various FPGA architectures - latest binary snapshot"
arch=(x86_64)
url="https://github.com/SymbiFlow/symbiflow-arch-defs"
license=('ISC')
depends=()
optdepends=('vtr' 'yosys' 'yosys-symbiflow-plugins')
provides=("$_pkgname")
conflicts=("$_pkgname")
_baseurl="https://storage.googleapis.com/$_pkgname/artifacts/prod/foss-fpga-tools/$_pkgname/continuous/install/$_buildnum/$_builddate"
source=("$_baseurl/$_pkgname-install-$_commit.tar.xz"
        "$_baseurl/$_pkgname-xc7a50t_test-$_commit.tar.xz"
        "$_baseurl/$_pkgname-xc7a100t_test-$_commit.tar.xz"
        "$_baseurl/$_pkgname-xc7a200t_test-$_commit.tar.xz"
        "$_baseurl/$_pkgname-xc7z010_test-$_commit.tar.xz"
        "$_baseurl/$_pkgname-xc7z020_test-$_commit.tar.xz")
sha256sums=('6cdb158efca060706cb25f8f3610316a1a1f263cca74d84463736c00790d6d6d'
            'dd2d5cb4ec59cc08a8f63a12ba4d8d76d046add90baac2f46bd8c74bf91c4d4f'
            '3f6e8c158e447c2bdaac6a7fc7b45557935ed1644a973d87213ff6faef1ff1b5'
            '5b325e5b9d7483aa050e50aa417817c0e668a97cac1b8ac145a2d0510b086edb'
            '7dd3ba9e665bf46374a3810e527150851f42a4b8f3dd8dd188fb4e74990b8e5f'
            'e20c7271d76da44e30ec2945e6b7b8103526193ae752cf28b02a9eca2994624e')

package() {
	install -dm755 "$pkgdir/usr" "$pkgdir/usr/lib/$_pkgname"
	cp -r bin share "$pkgdir/usr"

	sed -i "s#source \${MYPATH}/env#source /usr/lib/$_pkgname/env#" "$pkgdir"/usr/bin/*

	mv "$pkgdir/usr/bin/env" "$pkgdir/usr/bin/vpr_common" "$pkgdir/usr/lib/$_pkgname"
}
