# Maintainer: robertfoster
# Contributor: Cobalt Space <cobaltspace at protonmail dot com>
# Contributor: Andrew Stubbs <andrew.stubbs at gmail dot com>

pkgname=mimic
_pkgname=mimic1
pkgver=1.3.0.0
pkgrel=1
pkgdesc="Text-to-speech voice synthesis from the Mycroft project."
arch=(x86_64 i686)
url="https://mimic.mycroft.ai/"
license=('custom')
depends=(alsa-lib)
makedepends=('git' 'libtool' 'autoconf' 'automake' 'icu')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/MycroftAI/mimic1/archive/${pkgver}.tar.gz")

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    ./autogen.sh
    ./configure --prefix=/usr
}

check() {
    cd "$srcdir/$_pkgname-$pkgver"
    make -k check
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
    install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

md5sums=('696b0030ebf18382db8eb23f0b535150')
