# Maintainer: William Gathoye <william + aur at gathoye dot be>
# Contributor: Michael Rynn <michael dot rynn at parracan dot org>
# Contributor: mickael9 <mickael9 at gmail dot com>
# Contributor: Pierre Schmitz <pierre at archlinux dot de>
# Contributor: Thore Bödecker <me at foxxx0 dot de>
# Credit goes also to the maintainers and contributors of other PHP versions in
# AUR or official Arch Linux repositories. Specific patches might include code
# from other open source projects. In that case, credit is attributed in the
# specific commit.

pkgbase=php70
_pkgbase=${pkgbase%70}
pkgname=(
    "${pkgbase}"
    "${pkgbase}-cgi"
    "${pkgbase}-apache"
    "${pkgbase}-fpm"
    "${pkgbase}-embed"
    "${pkgbase}-phpdbg"
    "${pkgbase}-dblib"
    "${pkgbase}-enchant"
    "${pkgbase}-gd"
    "${pkgbase}-imap"
    "${pkgbase}-intl"
    "${pkgbase}-mcrypt"
    "${pkgbase}-odbc"
    "${pkgbase}-pgsql"
    "${pkgbase}-pspell"
    "${pkgbase}-snmp"
    "${pkgbase}-sqlite"
    "${pkgbase}-tidy"
    "${pkgbase}-xsl"
)
pkgver=7.0.33
pkgrel=1
pkgdesc='A general-purpose scripting language that is especially suited to web development (old stable 7.0 series)'
arch=('i686' 'x86_64')
url='http://www.php.net'
license=('PHP')

makedepends=(
    'apache' 'aspell' 'db' 'enchant' 'gd' 'gmp' 'icu' 'libmcrypt' 'libxslt'
    'libzip' 'net-snmp' 'postgresql-libs' 'sqlite' 'systemd' 'tidy' 'unixodbc'
    'curl' 'libtool' 'freetds' 'pcre' 'c-client'
)

source=(
    "https://php.net/distributions/${_pkgbase}-${pkgver}.tar.xz"{,.asc}
    'apache.patch'
    'apache.conf'
    'enchant-2.patch'
    'php-fpm.patch'
    'php-fpm.tmpfiles'
    'php.ini.patch'
    'php-icu-1100-Utilize-the-recommended-way-to-handle-the-icu-namespace.patch'
    'php-icu-1101-Simplify-namespace-access.patch'
    'freetype2.patch'
)
sha512sums=(
    '9298e185702ea801e9243671ecb0b781c2b04181a2f9fd6490bc14897a333a2c0cc88fe27b0c69c6dd0079629a71c330ed1aa337f48cac6cbd624addb8855500'
    'c0a0d045978aa569e0fbc54388f6fc52f53e1824dbffc05845709301118cf63a935cfbd1db12ca825c6d11b4a47e441e8da1c518823dc811535915ce1ed776ad'
    'f5e5431993c2e0c1806c4edf392030d0b605f4b3c4cebec036e810ff771b2327983f347221735673506e2c91ce2e18ad37ab7600261b684fe29491206171b4f3'
    '30cdc281c6e288cf8a0bf58a0ad74ad5b4e8205d2b0b6ab465fad97d810f7bfae4581ad836712998e834d2e90d38cacd22f19bb01e77fc4c9d200d95613fc669'
    '2d5f3aa71ce7d8da43f0f683f81b06258e3a0d95df4807a8acac91ff89fbe60484ef97856a908bce625b1610d0004767a6a8c622246086afe2f2d464977088b5'
    'e567dbe8b348364c0efb2d96492d4747e96f835adc2b3cb0c1563049fe6cabe9b1fde8ba24b690fb5d64339673e3088b2336f8cb5aa2c85e2f9fa50efd665865'
    'fde017c6382d687b80d660253cbe5d581ca886fee0d762bf519b245c6e39677194be542ec26c71c81d104422b444a0fdadd92ac1a17e9ea1e6ec34bfb204ca7d'
    'a98bba8d648853d653946c7a379ef62760282d8856fc1f79f84d66ac3c2082ef62c2fc0ed6a6762b50560ac60168fcdf946536a99131d397e89e906ee855419c'
    '70c859feff58650ff4a291b1725bce8f290ac6d92cacc4420d3ead5cbbdbcf567cd0ed4d79fdd8b0435cf6833f7b50fff798b2fae274c5fb1bb37a0984a45f9d'
    '33d40f3ae500cf583519ecfa271e36d727c38ff4ea9547d3d2c4d51c9fadd317ed614a048077ebdb116e3c84c11db95e6455cdfc80d092d217d070c98af56525'
    '24e0a8edf6161c5812ab38ae0919b3d0273e07e1bdea01b6b1df205f4043ad49973c7421a4c336814ae0ced8758518445bd66c6a6d82a729a727442730bc0a97'
)

validpgpkeys=(
    # PGP keys from PHP maintainer (upstream)
    # src.: http://php.net/downloads.php#gpg-7.0
    # pub   2048R/9C0D5763 2015-06-09 [expires: 2024-06-06]
    #       Key fingerprint = 1A4E 8B72 77C4 2E53 DBA9  C7B9 BCAA 30EA 9C0D 5763
    # uid                  Anatol Belski <ab@php.net>
    #
    # pub   2048R/33CFC8B3 2014-01-14 [expires: 2020-01-13]
    #       Key fingerprint = 6E4F 6AB3 21FD C07F 2C33  2E3A C2BF 0BC4 33CF C8B3
    # uid                  Ferenc Kovacs <tyrael@php.net>
    #
    # If you trust them, you can import them with
    # gpg --recv-keys 1A4E8B7277C42E53DBA9C7B9BCAA30EA9C0D5763 6E4F6AB321FDC07F2C332E3AC2BF0BC433CFC8B3
    # Receiving GPG keys might fail with the following error message:
    # gpg: keyserver receive failed: Connection refused
    # If this happens, just check your DNS or use another one.
    '1A4E8B7277C42E53DBA9C7B9BCAA30EA9C0D5763'
    '6E4F6AB321FDC07F2C332E3AC2BF0BC433CFC8B3'
)

prepare() {
    cd ${_pkgbase}-${pkgver}

    patch -p0 -i ../apache.patch
    patch -p0 -i ../php-fpm.patch
    patch -p0 -i ../php.ini.patch
    patch -p0 -i ../enchant-2.patch
    patch -p1 -i ../php-icu-1100-Utilize-the-recommended-way-to-handle-the-icu-namespace.patch
    patch -p1 -i ../php-icu-1101-Simplify-namespace-access.patch
    patch -p1 -i ../freetype2.patch
}

build() {
    local phpConfig="\
        --srcdir=../${_pkgbase}-${pkgver} \
        --config-cache \
        --prefix=/usr \
        --sbindir=/usr/bin \
        --sysconfdir=/etc/${pkgbase} \
        --localstatedir=/var \
        --libdir=/usr/lib/${pkgbase} \
        --datarootdir=/usr/share/${pkgbase} \
        --datadir=/usr/share/${pkgbase} \
        --program-suffix=${pkgbase#php} \
        --with-layout=GNU \
        --with-config-file-path=/etc/${pkgbase} \
        --with-config-file-scan-dir=/etc/${pkgbase}/conf.d \
        --disable-rpath \
        --without-pear \
        "

    local phpExtensions="\
        --enable-bcmath=shared \
        --enable-calendar=shared \
        --enable-dba=shared \
        --enable-exif=shared \
        --enable-ftp=shared \
        --enable-gd-native-ttf \
        --enable-intl=shared \
        --enable-mbstring \
        --enable-shmop=shared \
        --enable-soap=shared \
        --enable-sockets=shared \
        --enable-sysvmsg=shared \
        --enable-sysvsem=shared \
        --enable-sysvshm=shared \
        --enable-zip=shared \
        --with-bz2=shared \
        --with-curl=shared \
        --with-db4=/usr \
        --with-enchant=shared,/usr \
        --with-freetype-dir=/usr \
        --with-gd=shared,/usr \
        --with-gdbm \
        --with-gettext=shared \
        --with-gmp=shared \
        --with-iconv=shared \
        --with-imap-ssl \
        --with-imap=shared \
        --with-kerberos=/usr \
        --with-ldap=shared \
        --with-ldap-sasl \
        --with-libzip \
        --with-mcrypt=shared \
        --with-mhash \
        --with-mysql-sock=/run/mysqld/mysqld.sock \
        --with-mysqli=shared,mysqlnd \
        --with-openssl \
        --with-pcre-regex=/usr \
        --with-pdo-dblib=shared,/usr \
        --with-pdo-mysql=shared,mysqlnd \
        --with-pdo-odbc=shared,unixODBC,/usr \
        --with-pdo-pgsql=shared \
        --with-pdo-sqlite=shared,/usr \
        --with-pgsql=shared \
        --with-pspell=shared \
        --with-readline \
        --with-snmp=shared \
        --with-sqlite3=shared,/usr \
        --with-tidy=shared \
        --with-unixODBC=shared,/usr \
        --with-xmlrpc=shared \
        --with-xsl=shared \
        --with-zlib \
        --enable-pcntl \
        "

    EXTENSION_DIR=/usr/lib/${pkgbase}/modules
    export EXTENSION_DIR

    mkdir build
    cd build
    ln -s ../${_pkgbase}-${pkgver}/configure
    ./configure ${phpConfig} \
        --enable-cgi \
        --enable-fpm \
        --with-fpm-systemd \
        --with-fpm-acl \
        --with-fpm-user=http \
        --with-fpm-group=http \
        --enable-embed=shared \
        ${phpExtensions}
    make
    cd ../

    # apache
    # Reuse the previous configure step in order to save time
    cp -a build build-apache
    cd build-apache
    ./configure ${phpConfig} \
        --with-apxs2 \
        ${phpExtensions}
    make
    cd ../

    # phpdbg
    cp -a build build-phpdbg
    cd build-phpdbg
    ./configure ${phpConfig} \
        --enable-phpdbg \
        ${phpExtensions}
    make
    cd ../
}

package_php70() {
    pkgdesc='A general-purpose scripting language that is especially suited to web development'
    depends=('libxml2' 'curl' 'libzip' 'pcre')
    provides=("${_pkgbase}=$pkgver")
    backup=("etc/${pkgbase}/php.ini")

    cd build
    make -j1 INSTALL_ROOT=${pkgdir} install-{modules,cli,build,headers,programs,pharcmd}
    install -D -m644 ../${_pkgbase}-${pkgver}/php.ini-production ${pkgdir}/etc/${pkgbase}/php.ini
    install -d -m755 ${pkgdir}/etc/${pkgbase}/conf.d/

    # Remove static modules
    rm -f ${pkgdir}/usr/lib/${pkgbase}/modules/*.a

    # Remove modules provided by sub packages
    rm -f ${pkgdir}/usr/lib/${pkgbase}/modules/{enchant,gd,imap,intl,mcrypt,odbc,pdo_dblib,pdo_odbc,pgsql,pdo_pgsql,pspell,snmp,sqlite3,pdo_sqlite,tidy,xsl}.so

    # Remove empty directory
    rmdir ${pkgdir}/usr/include/php/include

    # Move include directory
    mv ${pkgdir}/usr/include/php ${pkgdir}/usr/include/${pkgbase}

    # Fix phar symlink
    rm ${pkgdir}/usr/bin/phar
    ln -sf phar.${pkgbase/php/phar} ${pkgdir}/usr/bin/${pkgbase/php/phar}

    # Rename executables
    mv ${pkgdir}/usr/bin/phar.{phar,${pkgbase/php/phar}}

    # Rename man pages
    mv ${pkgdir}/usr/share/man/man1/{phar,${pkgbase/php/phar}}.1
    mv ${pkgdir}/usr/share/man/man1/phar.{phar,${pkgbase/php/phar}}.1

    # Fix paths in executables
    sed -i "/^includedir=/c \includedir=/usr/include/${pkgbase}" ${pkgdir}/usr/bin/${pkgbase/php/phpize}
    sed -i "/^include_dir=/c \include_dir=/usr/include/${pkgbase}" ${pkgdir}/usr/bin/${pkgbase/php/php-config}

    # Make phpize use php-config70
    sed -i "/^\[  --with-php-config=/c \[  --with-php-config=PATH  Path to php-config [${pkgbase/php/php-config}]], ${pkgbase/php/php-config}, no)" ${pkgdir}/usr/lib/${pkgbase}/build/phpize.m4
}

package_php70-cgi() {
    pkgdesc='CGI and FCGI SAPI for PHP'
    depends=("${pkgbase}")
    provides=("${_pkgbase}-cgi=$pkgver")

    cd build
    make INSTALL_ROOT=${pkgdir} install-cgi
}

package_php70-apache() {
    pkgdesc='Apache SAPI for PHP'
    depends=("${pkgbase}" 'apache')
    backup=("etc/httpd/conf/extra/${pkgbase}_module.conf")

    install -D -m755 build-apache/libs/libphp7.so ${pkgdir}/usr/lib/httpd/modules/lib${pkgbase}.so
    install -D -m644 apache.conf ${pkgdir}/etc/httpd/conf/extra/${pkgbase}_module.conf
}

package_php70-fpm() {
    pkgdesc='FastCGI Process Manager for PHP'
    depends=("${pkgbase}" 'systemd')
    backup=("etc/${pkgbase}/php-fpm.conf" "etc/${pkgbase}/php-fpm.d/php-fpm.conf")
    options=('!emptydirs')

    cd build
    make INSTALL_ROOT=${pkgdir} install-fpm
    cd ..
    install -D -m644 build/sapi/fpm/php-fpm.service ${pkgdir}/usr/lib/systemd/system/${pkgbase}-fpm.service
    install -D -m644 php-fpm.tmpfiles ${pkgdir}/usr/lib/tmpfiles.d/${pkgbase}-fpm.conf
}

package_php70-embed() {
    pkgdesc='Embedded PHP SAPI library'
    depends=("${pkgbase}")
    provides=("${pkgbase}-embed=$pkgver")
    options=('!emptydirs')

    cd build
    make INSTALL_ROOT=${pkgdir} PHP_SAPI=embed install-sapi
    mv ${pkgdir}/usr/lib/libphp7.so ${pkgdir}/usr/lib/libphp-70.so
}

package_php70-phpdbg() {
    pkgdesc='Interactive PHP debugger'
    depends=("${pkgbase}")
    provides=("${pkgbase}-phpdbg=$pkgver")
    options=('!emptydirs')

    cd build-phpdbg
    make INSTALL_ROOT=${pkgdir} install-phpdbg
}

package_php70-dblib() {
    pkgdesc='dblib module for PHP'
    depends=("${pkgbase}")
    provides=("${pkgbase}-dblib=$pkgver")

    install -D -m755 build/modules/pdo_dblib.so ${pkgdir}/usr/lib/${pkgbase}/modules/pdo_dblib.so
}

package_php70-enchant() {
    pkgdesc='enchant module for PHP'
    depends=("${pkgbase}" 'enchant')
    provides=("${pkgbase}-enchant=$pkgver")

    install -D -m755 build/modules/enchant.so ${pkgdir}/usr/lib/${pkgbase}/modules/enchant.so
}

package_php70-gd() {
    pkgdesc='gd module for PHP'
    depends=("${pkgbase}" 'gd')
    provides=("${pkgbase}-gd=$pkgver")

    install -D -m755 build/modules/gd.so ${pkgdir}/usr/lib/${pkgbase}/modules/gd.so
}

package_php70-imap() {
    pkgdesc='imap module for PHP'
    depends=("${pkgbase}" 'c-client')
    provides=("${pkgbase}-imap=$pkgver")

    install -D -m755 build/modules/imap.so ${pkgdir}/usr/lib/${pkgbase}/modules/imap.so
}

package_php70-intl() {
    pkgdesc='intl module for PHP'
    depends=("${pkgbase}" 'icu')
    provides=("${pkgbase}-intl=$pkgver")

    install -D -m755 build/modules/intl.so ${pkgdir}/usr/lib/${pkgbase}/modules/intl.so
}

package_php70-mcrypt() {
    pkgdesc='mcrypt module for PHP'
    depends=("${pkgbase}" 'libmcrypt' 'libltdl')
    provides=("${pkgbase}-mcrypt=$pkgver")

    install -D -m755 build/modules/mcrypt.so ${pkgdir}/usr/lib/${pkgbase}/modules/mcrypt.so
}

package_php70-odbc() {
    pkgdesc='ODBC modules for PHP'
    depends=("${pkgbase}" 'unixodbc')
    provides=("${pkgbase}-odbc=$pkgver")

    install -D -m755 build/modules/odbc.so ${pkgdir}/usr/lib/${pkgbase}/modules/odbc.so
    install -D -m755 build/modules/pdo_odbc.so ${pkgdir}/usr/lib/${pkgbase}/modules/pdo_odbc.so
}

package_php70-pgsql() {
    pkgdesc='PostgreSQL modules for PHP'
    depends=("${pkgbase}" 'postgresql-libs')
    provides=("${pkgbase}-pgsql=$pkgver")

    install -D -m755 build/modules/pgsql.so ${pkgdir}/usr/lib/${pkgbase}/modules/pgsql.so
    install -D -m755 build/modules/pdo_pgsql.so ${pkgdir}/usr/lib/${pkgbase}/modules/pdo_pgsql.so
}

package_php70-pspell() {
    pkgdesc='pspell module for PHP'
    depends=("${pkgbase}" 'aspell')
    provides=("${pkgbase}-pspell=$pkgver")

    install -D -m755 build/modules/pspell.so ${pkgdir}/usr/lib/${pkgbase}/modules/pspell.so
}

package_php70-snmp() {
    pkgdesc='snmp module for PHP'
    depends=("${pkgbase}" 'net-snmp')
    provides=("${pkgbase}-snmp=$pkgver")

    install -D -m755 build/modules/snmp.so ${pkgdir}/usr/lib/${pkgbase}/modules/snmp.so
}

package_php70-sqlite() {
    pkgdesc='sqlite module for PHP'
    depends=("${pkgbase}" 'sqlite')
    provides=("${pkgbase}-sqlite=$pkgver")

    install -D -m755 build/modules/sqlite3.so ${pkgdir}/usr/lib/${pkgbase}/modules/sqlite3.so
    install -D -m755 build/modules/pdo_sqlite.so ${pkgdir}/usr/lib/${pkgbase}/modules/pdo_sqlite.so
}

package_php70-tidy() {
    pkgdesc='tidy module for PHP'
    depends=("${pkgbase}" 'tidyhtml')
    provides=("${pkgbase}-tidy=$pkgver")

    install -D -m755 build/modules/tidy.so ${pkgdir}/usr/lib/${pkgbase}/modules/tidy.so
}

package_php70-xsl() {
    pkgdesc='xsl module for PHP'
    depends=("${pkgbase}" 'libxslt')
    provides=("${pkgbase}-xsl=$pkgver")

    install -D -m755 build/modules/xsl.so ${pkgdir}/usr/lib/${pkgbase}/modules/xsl.so
}
