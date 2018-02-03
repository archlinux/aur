#
# Maintainer: eiNjel <alekw3@gmail.com>
# 
# available sources https://sourceforge.net/projects/talendesb/

pkgname=talend-open-studio-esb
_pkgname=talend-open-studio-esb
pkgver=7.0.1
pkgrel=1
talend_date="20171115_1047"
talend_ver="$pkgver" 
talend_ver+="M"
talend_ver+="$pkgrel"
pkgdesc="Talend Open Studio for ESB $pkgver x86_64"
url="https://einjel-frontend.herokuapp.com"

arch=('x86_64')
license=('GPL')

depends=('unzip' 'jdk8-openjdk' 'jre8-openjdk' 'jre8-openjdk-headless')
optdepends=('jdk7-openjdk' 'jre7-openjdk' 'jre7-openjdk-headless')

options=('!libtool' '!emptydirs')

provides=('talend')
conflicts=('talend')

source=("https://sourceforge.net/projects/talendesb/files/Talend%20Open%20Studio%20for%20ESB/$talend_ver/TOS_ESB-$talend_date-V$talend_ver.zip/download"
	    'talend.desktop'
	    'talend.png'
	    'talend')

sha256sums=('SKIP'
            'SKIP'
            'd8a58f5a2c9431c1f0edc36d5fa2a93f42593b063548cc539227c895694737aa'
            'SKIP')

prepare() {
	cd "$srcdir"/
}

build() {
	cd "$srcdir"/
}

package() {
    cd "$srcdir"/
    echo "cd /opt/talend-$pkgver/Studio/ && sh TOS_ESB-linux-gtk-x86.sh" > "$srcdir/talend"
    echo "Icon=/opt/talend-$pkgver/talend.png" >> "$srcdir/talend.desktop"
    install -Dm755 "$srcdir/talend.desktop" "$pkgdir/usr/share/applications/talend-$pkgver.desktop"
    install -Dm755 "$srcdir/talend.png" "$pkgdir/opt/talend-$pkgver/talend.png"
    install -Dm755 "$srcdir/talend" "$pkgdir/usr/bin/talend"
    mv "$srcdir/download" "$pkgdir/opt/talend-$pkgver/download.zip"
    cd "$pkgdir/opt/talend-$pkgver/" && unzip download.zip && rm download.zip
}
