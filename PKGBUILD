# Maintainer: William Gathoye <william + aur at gathoye dot be>
# Maintainer: Maxwell Pray a.k.a. Synthead <synthead at gmail dot com>
# Contributor: Pierre Schmitz <pierre at archlinux dot de>
# Credit goes also to the maintainers and contributors of other PHP versions in
# AUR or official Arch Linux repositories. Specific patches might include code
# from other open source projects. In that case, credit is attributed in the
# specific commit.

pkgbase=php71
_pkgbase=${pkgbase%71}
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
pkgver=7.1.33
_pkgver=${pkgbase//php}
pkgrel=1
pkgdesc='A general-purpose scripting language that is especially suited to web development (old stable 7.0 series)'
arch=('i686' 'x86_64')
url='http://www.php.net'
license=('PHP')

makedepends=(
    'apache' 'aspell' 'db' 'enchant' 'gd' 'gmp' 'icu' 'libmcrypt' 'libxslt'
    'libzip' 'net-snmp' 'postgresql-libs' 'sqlite' 'systemd' 'tidy' 'unixodbc'
    'curl' 'libtool' 'postfix' 'freetds' 'pcre' 'c-client' 'tidyhtml'
)

source=(
    "https://php.net/distributions/${_pkgbase}-${pkgver}.tar.xz"{,.asc}
    'apache.patch'
    'apache.conf'
    'enchant-2.patch'
    'freetype2.patch'
    'php-fpm.patch'
    'php-fpm.tmpfiles'
    'php.ini.patch'
    'php-icu-1100-Utilize-the-recommended-way-to-handle-the-icu-namespace.patch'
    'php-icu-1101-Simplify-namespace-access.patch'
)
sha512sums=(
    'ed37a79e3402c767f20e55c1cbe27957cc78240eafc719fffccd7d29ae10a45112aa0f29082f56133cd9c25f2750e9e57246d95b4f38d766f49bd29d1397eb1d'
    '022d1fc374dce70209a266b512fbfd2b817a160475d298c970abbd7d9a79be36eb995a9519bbf142f4878df74b29c006c76b589114ebc455de0f3cd07b84f375'
    'f5e5431993c2e0c1806c4edf392030d0b605f4b3c4cebec036e810ff771b2327983f347221735673506e2c91ce2e18ad37ab7600261b684fe29491206171b4f3'
    '30cdc281c6e288cf8a0bf58a0ad74ad5b4e8205d2b0b6ab465fad97d810f7bfae4581ad836712998e834d2e90d38cacd22f19bb01e77fc4c9d200d95613fc669'
    '2d5f3aa71ce7d8da43f0f683f81b06258e3a0d95df4807a8acac91ff89fbe60484ef97856a908bce625b1610d0004767a6a8c622246086afe2f2d464977088b5'
    'a664b69aea8c21c50c852f918515d9fe1a931d7f88ec77ec86a20810266515745430d89513ee2e0bb301a29f1fc7ab0d2634076830b4da8ea1e47467fb658678'
    'a23e13180449ace0cfe07e19043615ca7e1dbf254fd24f2446cd2d824728430258ec4140325508169480eaec950ad4737b673417bd70e0f9d4538f1ab3b98816'
    '48a97ab0cedd92539b8fe4c82e59312b563a73a8ca537b5a1b2091bfd287f255e94a32c2e5398ccfa7248ef322275a15a4edb817bad6ccf430c79d2f9c5cf0e9'
    'b6ff1c8575c7564ede17ec8c959141a065a9c4e3cba059a1138b9ecc85f23632d7e5980d65742f7fc1ce404ce613f7abb2f5f7a45039d606c9c590ccf3a2301d'
    '70c859feff58650ff4a291b1725bce8f290ac6d92cacc4420d3ead5cbbdbcf567cd0ed4d79fdd8b0435cf6833f7b50fff798b2fae274c5fb1bb37a0984a45f9d'
    '33d40f3ae500cf583519ecfa271e36d727c38ff4ea9547d3d2c4d51c9fadd317ed614a048077ebdb116e3c84c11db95e6455cdfc80d092d217d070c98af56525'
)

validpgpkeys=(
    # PGP keys from PHP maintainer (upstream)
    # src.: https://secure.php.net/downloads.php#gpg-7.1
    # pub   4096R/7BD5DCD0 2016-05-07
    #       Key fingerprint = A917 B1EC DA84 AEC2 B568 FED6 F50A BC80 7BD5 DCD0
    # uid                  Davey Shafik <davey@php.net>
    #
    # pub   2048R/31CBD89E 2016-12-08
    #       Key fingerprint = 5289 95BF EDFB A719 1D46  839E F9BA 0ADA 31CB D89E
    # uid                  Joe Watkins <krakjoe@php.net>
    #
    # pub   4096R/70D12172 2017-04-14 [expires: 2024-04-21]
    #       Key fingerprint = 1729 F839 38DA 44E2 7BA0  F4D3 DBDB 3974 70D1 2172
    # uid                  Sara Golemon <pollita@php.net>
    #
    # If you trust them, you can import them with
    # gpg --recv-keys A917B1ECDA84AEC2B568FED6F50ABC807BD5DCD0 528995BFEDFBA7191D46839EF9BA0ADA31CBD89E 1729F83938DA44E27BA0F4D3DBDB397470D12172
    # Receiving GPG keys might fail with the following error message:
    # gpg: keyserver receive failed: Connection refused
    # If this happens, just check your DNS or use another one.
    'A917B1ECDA84AEC2B568FED6F50ABC807BD5DCD0'
    '528995BFEDFBA7191D46839EF9BA0ADA31CBD89E'
    '1729F83938DA44E27BA0F4D3DBDB397470D12172'
)

prepare() {
    cd ${_pkgbase}-${pkgver}

    patch -p0 -i ../apache.patch
    patch -p0 -i ../enchant-2.patch
    patch -p0 -i ../freetype2.patch
    patch -p0 -i ../php-fpm.patch
    patch -p1 -i ../php-icu-1100-Utilize-the-recommended-way-to-handle-the-icu-namespace.patch
    patch -p1 -i ../php-icu-1101-Simplify-namespace-access.patch
    patch -p0 -i ../php.ini.patch
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
}

check() {
    cd ${srcdir}/${_pkgbase}-${pkgver}

    # Check if sendmail was configured correctly (FS#47600)
    ${srcdir}/build/sapi/cli/php -n -r 'echo ini_get("sendmail_path");' | grep -q '/usr/bin/sendmail'

    export REPORT_EXIT_STATUS=1
    export NO_INTERACTION=1
    export SKIP_ONLINE_TESTS=1
    export SKIP_SLOW_TESTS=1

    ${srcdir}/build/sapi/cli/php -n run-tests.php -n -P {tests,Zend}
}

package_php71() {
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

package_php71-cgi() {
    pkgdesc='CGI and FCGI SAPI for PHP'
    depends=("${pkgbase}")
    provides=("${_pkgbase}-cgi=$pkgver")

    cd build
    make INSTALL_ROOT=${pkgdir} install-cgi
}

package_php71-apache() {
    pkgdesc='Apache SAPI for PHP'
    depends=("${pkgbase}" 'apache')
    backup=("etc/httpd/conf/extra/${pkgbase}_module.conf")

    install -D -m755 build-apache/libs/libphp7.so ${pkgdir}/usr/lib/httpd/modules/lib${pkgbase}.so
    install -D -m644 apache.conf ${pkgdir}/etc/httpd/conf/extra/${pkgbase}_module.conf
}

package_php71-fpm() {
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

package_php71-embed() {
    pkgdesc='Embedded PHP SAPI library'
    depends=("${pkgbase}")
    provides=("${pkgbase}-embed=$pkgver")
    options=('!emptydirs')

    cd build
    make INSTALL_ROOT=${pkgdir} PHP_SAPI=embed install-sapi
    mv ${pkgdir}/usr/lib/libphp7.so ${pkgdir}/usr/lib/libphp-${_pkgver}.so
}

package_php71-phpdbg() {
    pkgdesc='Interactive PHP debugger'
    depends=("${pkgbase}")
    provides=("${pkgbase}-phpdbg=$pkgver")
    options=('!emptydirs')

    cd build-phpdbg
    make INSTALL_ROOT=${pkgdir} install-phpdbg
}

package_php71-dblib() {
    pkgdesc='dblib module for PHP'
    depends=("${pkgbase}")
    provides=("${pkgbase}-dblib=$pkgver")

    install -D -m755 build/modules/pdo_dblib.so ${pkgdir}/usr/lib/${pkgbase}/modules/pdo_dblib.so
}

package_php71-enchant() {
    pkgdesc='enchant module for PHP'
    depends=("${pkgbase}" 'enchant')
    provides=("${pkgbase}-enchant=$pkgver")

    install -D -m755 build/modules/enchant.so ${pkgdir}/usr/lib/${pkgbase}/modules/enchant.so
}

package_php71-gd() {
    pkgdesc='gd module for PHP'
    depends=("${pkgbase}" 'gd')
    provides=("${pkgbase}-gd=$pkgver")

    install -D -m755 build/modules/gd.so ${pkgdir}/usr/lib/${pkgbase}/modules/gd.so
}

package_php71-imap() {
    pkgdesc='imap module for PHP'
    depends=("${pkgbase}" 'c-client')
    provides=("${pkgbase}-imap=$pkgver")

    install -D -m755 build/modules/imap.so ${pkgdir}/usr/lib/${pkgbase}/modules/imap.so
}

package_php71-intl() {
    pkgdesc='intl module for PHP'
    depends=("${pkgbase}" 'icu')
    provides=("${pkgbase}-intl=$pkgver")

    install -D -m755 build/modules/intl.so ${pkgdir}/usr/lib/${pkgbase}/modules/intl.so
}

package_php71-mcrypt() {
    pkgdesc='mcrypt module for PHP'
    depends=("${pkgbase}" 'libmcrypt' 'libltdl')
    provides=("${pkgbase}-mcrypt=$pkgver")

    install -D -m755 build/modules/mcrypt.so ${pkgdir}/usr/lib/${pkgbase}/modules/mcrypt.so
}

package_php71-odbc() {
    pkgdesc='ODBC modules for PHP'
    depends=("${pkgbase}" 'unixodbc')
    provides=("${pkgbase}-odbc=$pkgver")

    install -D -m755 build/modules/odbc.so ${pkgdir}/usr/lib/${pkgbase}/modules/odbc.so
    install -D -m755 build/modules/pdo_odbc.so ${pkgdir}/usr/lib/${pkgbase}/modules/pdo_odbc.so
}

package_php71-pgsql() {
    pkgdesc='PostgreSQL modules for PHP'
    depends=("${pkgbase}" 'postgresql-libs')
    provides=("${pkgbase}-pgsql=$pkgver")

    install -D -m755 build/modules/pgsql.so ${pkgdir}/usr/lib/${pkgbase}/modules/pgsql.so
    install -D -m755 build/modules/pdo_pgsql.so ${pkgdir}/usr/lib/${pkgbase}/modules/pdo_pgsql.so
}

package_php71-pspell() {
    pkgdesc='pspell module for PHP'
    depends=("${pkgbase}" 'aspell')
    provides=("${pkgbase}-pspell=$pkgver")

    install -D -m755 build/modules/pspell.so ${pkgdir}/usr/lib/${pkgbase}/modules/pspell.so
}

package_php71-snmp() {
    pkgdesc='snmp module for PHP'
    depends=("${pkgbase}" 'net-snmp')
    provides=("${pkgbase}-snmp=$pkgver")

    install -D -m755 build/modules/snmp.so ${pkgdir}/usr/lib/${pkgbase}/modules/snmp.so
}

package_php71-sqlite() {
    pkgdesc='sqlite module for PHP'
    depends=("${pkgbase}" 'sqlite')
    provides=("${pkgbase}-sqlite=$pkgver")

    install -D -m755 build/modules/sqlite3.so ${pkgdir}/usr/lib/${pkgbase}/modules/sqlite3.so
    install -D -m755 build/modules/pdo_sqlite.so ${pkgdir}/usr/lib/${pkgbase}/modules/pdo_sqlite.so
}

package_php71-tidy() {
    pkgdesc='tidy module for PHP'
    depends=("${pkgbase}" 'tidyhtml')
    provides=("${pkgbase}-tidy=$pkgver")

    install -D -m755 build/modules/tidy.so ${pkgdir}/usr/lib/${pkgbase}/modules/tidy.so
}

package_php71-xsl() {
    pkgdesc='xsl module for PHP'
    depends=("${pkgbase}" 'libxslt')
    provides=("${pkgbase}-xsl=$pkgver")

    install -D -m755 build/modules/xsl.so ${pkgdir}/usr/lib/${pkgbase}/modules/xsl.so
}
