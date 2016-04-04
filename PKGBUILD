_pkgname=jdk
pkgname=denix-jdk8
_major=8
_minor=77
_build=b03
pkgver=${_major}u${_minor}
pkgrel=1
pkgdesc="Oracle Java $_major Development Kit (in /opt for servers)"
arch=('i686' 'x86_64' 'armv7h')
url='http://www.oracle.com/technetwork/java/javase/downloads'
license=('custom')

provides=("java-runtime=$_major" "java-runtime-headless=$_major" "java-web-start=$_major" "java-environment=$_major"
          "java-runtime-jre=$_major" "java-runtime-headless-jre=$_major" "java-web-start-jre=$_major" "java-environment-jdk=$_major"
          "java-openjfx=$_major")

# Variables
DLAGENTS=('http::/usr/bin/curl -fLC - --retry 3 --retry-delay 3 -b oraclelicense=a -o %o %u')
_jname=${_pkgname}${_major}

source=("jdk.sh")
source_i686=("http://download.oracle.com/otn-pub/java/jdk/$pkgver-$_build/$_pkgname-$pkgver-linux-i586.tar.gz")
source_x86_64=("http://download.oracle.com/otn-pub/java/jdk/$pkgver-$_build/$_pkgname-$pkgver-linux-x64.tar.gz")
source_armv7h=("http://download.oracle.com/otn-pub/java/jdk/$pkgver-$_build/$_pkgname-$pkgver-linux-arm32-vfp-hflt.tar.gz")

md5sums=('26075c8997529cd97f840a6e4b0925db')
md5sums_i686=('e5bac32e2a7ab5cf9068ba92ba084472')
md5sums_x86_64=('ee501bef73ba7fac255f0593e595d8eb')
md5sums_armv7h=('fe99c43db6fe17670c327fe05066e402')

package() {
    cd ${_pkgname}1.${_major}.0_${_minor}

    msg2 "Removing redundancies..."
    rm    db/bin/*.bat
    rm    db/3RDPARTY
    rm    db/LICENSE
    rm -r jre/lib/desktop/icons/HighContrast
    rm -r jre/lib/desktop/icons/HighContrastInverse
    rm -r jre/lib/desktop/icons/LowContrast
    rm    jre/lib/fontconfig.*.bfc
    rm    jre/lib/fontconfig.*.properties.src
    rm -r jre/plugin/
    rm    jre/*.txt
    rm    jre/COPYRIGHT
    rm    jre/LICENSE
    rm    jre/README
    rm    *.txt
    rm    COPYRIGHT
    rm    LICENSE
    rm    README*
    rm -r man

    install -d -m755 $pkgdir/opt/${_pkgname}1.${_major}.0_${_minor}
    install -d -m755 $pkgdir/etc/profile.d
    install -D -m644 $srcdir/jdk.sh $pkgdir/etc/profile.d/jdk.sh
    cp -r * $pkgdir/opt/${_pkgname}1.${_major}.0_${_minor}
    ln -s /opt/${_pkgname}1.${_major}.0_${_minor} "$pkgdir/opt/java"
}
