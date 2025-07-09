# Maintainer: Aleks Grabowski <hurufu+aur@gmail.com>
# Contributor: Nikolaos Bezirgiannis <bezeria@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Jachym Barvinek <jachymb@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: John Proctor <jproctor@prium.net>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>

pkgname=swi-prolog-git
pkgver=9.3.25.r28.g19f18da1a
pkgrel=1
pkgdesc='Comprehensive Prolog environment (latest git development version)'
arch=(x86_64 i686)
url='http://www.swi-prolog.org/'
license=(BSD-2-Clause)
depends=(gmp readline openssl libarchive gperftools)
makedepends=('git' 'libxft' 'libjpeg' 'unixodbc' 'libxpm' 'libxinerama' 'cmake' 'ninja')
optdepends=('unixodbc: for using the odbc4pl library'
            'libjpeg: for using the pl2xpce library'
            'libxpm: for using the pl2xpce library'
            'libxinerama: for using the pl2xpce library'
            'libxft: for using the pl2xpce library'
            'java-environment: for interfacing java with the jpl package')
options=(!makeflags !lto)
_pkgname=swipl-devel # Can be swipl or swipl-devel
source=(
    "git+https://github.com/SWI-Prolog/$_pkgname.git"
    'modules/packages-chr::git+https://github.com/SWI-Prolog/packages-chr.git'
    'modules/packages-jpl::git+https://github.com/SWI-Prolog/packages-jpl.git'
    'modules/packages-clpqr::git+https://github.com/SWI-Prolog/packages-clpqr.git'
    'modules/packages-inclpr::git+https://github.com/SWI-Prolog/packages-inclpr.git'
    'modules/bench::git+https://github.com/SWI-Prolog/bench.git'
    'modules/packages-utf8proc::git+https://github.com/SWI-Prolog/packages-utf8proc.git'
    'modules/contrib-protobufs::git+https://github.com/SWI-Prolog/contrib-protobufs.git'
    'modules/packages-xpce::git+https://github.com/SWI-Prolog/packages-xpce.git'
    'modules/packages-odbc::git+https://github.com/SWI-Prolog/packages-odbc.git'
    'modules/packages-sgml::git+https://github.com/SWI-Prolog/packages-sgml.git'
    'modules/packages-clib::git+https://github.com/SWI-Prolog/packages-clib.git'
    'modules/packages-http::git+https://github.com/SWI-Prolog/packages-http.git'
    'modules/packages-plunit::git+https://github.com/SWI-Prolog/packages-plunit.git'
    'modules/packages-pldoc::git+https://github.com/SWI-Prolog/packages-pldoc.git'
    'modules/packages-RDF::git+https://github.com/SWI-Prolog/packages-RDF.git'
    'modules/packages-semweb::git+https://github.com/SWI-Prolog/packages-semweb.git'
    'modules/packages-ssl::git+https://github.com/SWI-Prolog/packages-ssl.git'
    'modules/packages-zlib::git+https://github.com/SWI-Prolog/packages-zlib.git'
    'modules/contrib-tipc::git+https://github.com/SWI-Prolog/contrib-tipc.git'
    'modules/packages-table::git+https://github.com/SWI-Prolog/packages-table.git'
    'modules/packages-nlp::git+https://github.com/SWI-Prolog/packages-nlp.git'
    'modules/packages-bdb::git+https://github.com/SWI-Prolog/packages-bdb.git'
    'modules/packages-cpp::git+https://github.com/SWI-Prolog/packages-cpp.git'
    'modules/packages-ltx2htm::git+https://github.com/SWI-Prolog/packages-ltx2htm.git'
    'modules/packages-windows::git+https://github.com/SWI-Prolog/packages-windows.git'
    'modules/packages-PDT::git+https://github.com/SWI-Prolog/packages-PDT.git'
    'modules/packages-archive::git+https://github.com/SWI-Prolog/packages-archive.git'
    'modules/distro-debian::git+https://github.com/SWI-Prolog/distro-debian.git'
    'modules/packages-swipl-win::git+https://github.com/SWI-Prolog/packages-swipl-win.git'
    'modules/packages-pengines::git+https://github.com/SWI-Prolog/packages-pengines.git'
    'modules/packages-cql::git+https://github.com/SWI-Prolog/packages-cql.git'
    'modules/packages-readline::git+https://github.com/SWI-Prolog/packages-readline.git'
    'modules/packages-libedit::git+https://github.com/SWI-Prolog/packages-libedit.git'
    'modules/packages-pcre::git+https://github.com/SWI-Prolog/packages-pcre.git'
    'modules/packages-yaml::git+https://github.com/SWI-Prolog/packages-yaml.git'
    'modules/packages-paxos::git+https://github.com/SWI-Prolog/packages-paxos.git'
    'modules/packages-redis::git+https://github.com/SWI-Prolog/packages-redis.git'
    'modules/packages-stomp::git+https://github.com/SWI-Prolog/packages-stomp.git'
    'modules/packages-mqi::git+https://github.com/SWI-Prolog/packages-mqi.git'
    'modules/packages-sweep::git+https://github.com/SWI-Prolog/packages-sweep.git'
    'modules/packages-swipy::git+https://github.com/SWI-Prolog/packages-swipy.git'
)
sha256sums=(
    SKIP SKIP SKIP SKIP SKIP SKIP SKIP SKIP SKIP SKIP SKIP SKIP SKIP SKIP SKIP
    SKIP SKIP SKIP SKIP SKIP SKIP SKIP SKIP SKIP SKIP SKIP SKIP SKIP SKIP SKIP
    SKIP SKIP SKIP SKIP SKIP SKIP SKIP SKIP SKIP SKIP SKIP SKIP
)
conflicts=('swi-prolog')
provides=('swi-prolog')

pkgver() {
    git -C "$srcdir/$_pkgname" describe --long | sed -r 's/^V//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/$_pkgname"
    sed -i -e "/url/ s/.git//; s^= \.\.^= $srcdir^" .gitmodules
    git -c protocol.file.allow=always submodule update --init
    patch -p1 <"$srcdir/../0001-Add-hamcrest-generator-to-classpath.patch"
}

build() {
    mkdir -p build
    cd build
    cmake -G Ninja -DCMAKE_INSTALL_PREFIX=/usr ../$_pkgname
    ninja
}

check() {
    env -C build ctest -j 8
}

package() {
    DESTDIR="$pkgdir" ninja -C build install
}
