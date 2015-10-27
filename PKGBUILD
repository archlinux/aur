# Maintainer: Score_Under <seejay.11@gmail.com>
_pkgname=ksm_preload
pkgname=$_pkgname-git
pkgver=0.10.4.r254cc3b
pkgrel=1
arch=(i686 x86_64)
license=GPL3
source=("git+https://github.com/unbrice/$_pkgname.git"
        ksm-wrapper)
optdepends=('sh: ksm-wrapper script')
sha256sums=('SKIP'
            'c58dd36fd3a58d4e94da75472b3dd864ce865bb35e23fb422abda446ddc4afc4')

cdgit() { cd -- "$_pkgname"; }

pkgver() {
    cdgit
    local version="$(git describe --always --match 'v*.*')"
    version=${version#v}
    version=${version//-/.}
    version=${version/.g/.r}
    printf '%s\n' "$version"
}

build() {
    cdgit
    autoreconf -is
    ./configure --prefix=/usr
    make
}

package() {
    install -m755 -Dt "$pkgdir/usr/bin" ksm-wrapper
    cdgit
    make install DESTDIR="$pkgdir"
}
