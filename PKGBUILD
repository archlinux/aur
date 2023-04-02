# Maintainer: bipin Kumar <kbipinkumar@pm.me>

pkgname=codonw
_pkgname=codonW
pkgver=1.4.4
_pkgver=${pkgver//./_}
pkgrel=2
pkgdesc="Multivariate analysis (correspondence analysis) of codon and amino acid usage"
arch=(x86_64)
url="https://codonw.sourceforge.net/"
license=('GPL2')
depends=('glibc')
makedepends=('quilt')
source=(
        "$pkgname-$pkgver.tar.gz::"https://sourceforge.net/projects/codonw/files/codonw/SourceCode-${pkgver}%28gz%29/CodonWSourceCode_${_pkgver}.tar.gz""
        'define_linux.patch'
        'enable_clean.patch'
        'fix_link_name_clashes.patch'
        'hardening.patch'
        'helpfile_location.patch'
        'remove_nondeterminism.patch'
        'remove_pause.patch'
        'spelling.patch'
        'series'
        )

sha256sums=('951e2a686f7849e0fa225b83b09842d4cf822ecafd67bff0438fc815512183b8'
            'c356ee8f17e8739d3d14fcf19b086ba1b9e2135a6185aa58411ca0492271d243'
            '3ad560b6f3b20ca75c5858435d91fd8a53b43d98003000cb111a368a7ec6b539'
            '1052526f7211ca5d33a6e6437b835f2636de86a041908e0027a2765b2c9fffbc'
            '7644178d7e5bec4f59b5653ff98c2def75f5a1427f1ff5edc9f212b62dcf28e0'
            '470ff6f8138fe41a2cbeccc6b877be5beef98e1a47cad80063eda1b0c4658db3'
            '56761240824243e3787b8324278358aa54a2fb54c90faa53365e9901e5e224fa'
            '6f245bcc4afffd93d40092db8b10c52aca6af72e03945683500469bf5870fc34'
            '8d542c9cc0a2498979c0dc8d20105994e41ab172e345f1903ca1f99ecf537897'
            '63c219e58f21c105069925549c1518c533574a846d4b956a124378383242db82')

prepare() {
  mkdir -p ${_pkgname}/patches
  cp *.patch ${_pkgname}/patches
  cp series ${_pkgname}/patches
  cd ${_pkgname}
  quilt push -a
}

build() {
	cd "$_pkgname"
	make -f Makefile
}

package() {
    cd ${_pkgname}
    install -d  "$pkgdir"/usr/share/doc/${pkgname}/
    install -Dm755 codonw "$pkgdir"/usr/bin/codonw
	install -Dm755 codonW.hlp "$pkgdir"/usr/share/doc/${pkgname}/
}
