# Maintainer: Justin Kromlinger <hashworks@archlinux.org>
# Contributor: Markus Sommer <markus@splork.de>
#
# This is similar to the valheim-server package by Markus Sommer,
# but doesn't include the server binaries and instead depends on
# steamcmd on the server to install/update the server on every
# systemd run.
#
# I've also added env variables for white/black/admin lists.
#
# The pkgver does not reflect the valheim version and just counts up.
#

pkgname=valheim-server-systemd
pkgver=1.0.0
pkgrel=1
pkgdesc="Dedicated server for the Valheim PC game using systemd and steamcmd"
arch=('x86_64')
url='https://www.valheimgame.com/'
license=('custom:IronGateLicense')
depends=("zlib" "gcc-libs" "lib32-glibc" "steamcmd")
backup=("etc/valheim/server.conf")
conflicts=("valheim-server")
source=('valheim-server.service'
        'server.conf'
        'valheim.sysusers'
        'valheim.tmpfiles')
sha512sums=('4f64f39c073fec909b3f3f725cf3f4b4f18b546572471227e928da418c6d9290b37fee2c1a366341ae5bd89f038ad8ce22b2f68ddfa6682931dc694558caa499'
            '7c71e3d984ae4e43bdfb759a9d18755d232809cd9cd58c54f494f2a2e8357245a848f176a117f0764ef533884ea8da978de3b8cc54592c44a2a0b359d02e7416'
            '70b148c72fce74403acae88beb44d5487652851c870cf0659491250c735d29bffe2f356c26e513ebe279d043349a202e0b92d095c931fa11c64159b93482a7f6'
            'b02a81f6ebbf393aeeb52735e9e84f778b958afcf18bb6f90fff81799b28666e086c988d75c59e66f7b5b53be667cc63034ab31898d85684292645fff293fabc')

package() {
    cd $srcdir

    install -D -m 0644 valheim-server.service "$pkgdir/usr/lib/systemd/system/valheim-server.service"
    install -D -m 0644 server.conf "$pkgdir/etc/valheim/server.conf"
    install -D -m 0644 valheim.sysusers "$pkgdir/usr/lib/sysusers.d/valheim.conf"
    install -D -m 0644 valheim.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/valheim.conf"
}
