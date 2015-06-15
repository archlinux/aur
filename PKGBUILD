# Maintainer: Alan Jenkins <alan.james.jenkins [at] gmail.com>
# Original wolf-data package by M0Rf30
pkgname=wolf-data-steam
pkgver=1.41b
pkgrel=3
pkgdesc="Return to Castle Wolfenstein native Linux Single Player data via Steam"
arch=('any')
conflicts=('wolf-data')
provides=('wolf-data')
depends=('steamcmd')
url="ftp://ftp.internat.freebsd.org/pub/FreeBSD/distfiles/"
license=('GPL')
install='wolf-data-steam.install'
source=("https://dl.dropboxusercontent.com/s/97qyelre9iryv37/wolf-linux-${pkgver}.x86.run")
md5sums=('2aa37968aff19d665ed6c001773b2de3')

package() {
    # Set Install Files to Executable
    cd $srcdir
    chmod +x wolf-linux-${pkgver}.x86.run

    # Extract Linux Game Files
    ./wolf-linux-${pkgver}.x86.run --target files --noexec
    cd files
    # Remove Unneeded Files and Directories
    cd main
    rm *.so

    # Move Data to Package Directory
    mkdir -p $pkgdir/opt/wolf-data
    cp -r * $pkgdir/opt/wolf-data/

    # Use steamcmd to get the rest of the data required.
    mkdir -p $srcdir/wolf-data-steam
    printf "Enter your Steam username:"
    read steam_username
    steamcmd +@sSteamCmdForcePlatformType windows +@ShutdownOnFailedCommand 1 +force_install_dir $srcdir/wolf-data-steam +login $steam_username "+app_update 9010 validate" +quit

    # Move required files to pkgdir
    install -D -m 644 $srcdir/files/main/mp_bin.pk3 $pkgdir/opt/wolf-data/mp_bin.pk3
    install -D -m 644 $srcdir/wolf-data-steam/Main/mp_pak0.pk3 $pkgdir/opt/wolf-data/mp_pak0.pk3
    install -D -m 644 $srcdir/files/main/mp_pak1.pk3 $pkgdir/opt/wolf-data/mp_pak1.pk3
    install -D -m 644 $srcdir/files/main/mp_pak2.pk3 $pkgdir/opt/wolf-data/mp_pak2.pk3
    install -D -m 644 $srcdir/files/main/mp_pak3.pk3 $pkgdir/opt/wolf-data/mp_pak3.pk3
    install -D -m 644 $srcdir/files/main/mp_pak4.pk3 $pkgdir/opt/wolf-data/mp_pak4.pk3
    install -D -m 644 $srcdir/files/main/mp_pak5.pk3 $pkgdir/opt/wolf-data/mp_pak5.pk3
    install -D -m 644 $srcdir/files/main/mp_pakmaps0.pk3 $pkgdir/opt/wolf-data/mp_pakmaps0.pk3
    install -D -m 644 $srcdir/files/main/mp_pakmaps1.pk3 $pkgdir/opt/wolf-data/mp_pakmaps1.pk3
    install -D -m 644 $srcdir/files/main/mp_pakmaps2.pk3 $pkgdir/opt/wolf-data/mp_pakmaps2.pk3
    install -D -m 644 $srcdir/files/main/mp_pakmaps3.pk3 $pkgdir/opt/wolf-data/mp_pakmaps3.pk3
    install -D -m 644 $srcdir/files/main/mp_pakmaps4.pk3 $pkgdir/opt/wolf-data/mp_pakmaps4.pk3
    install -D -m 644 $srcdir/files/main/mp_pakmaps5.pk3 $pkgdir/opt/wolf-data/mp_pakmaps5.pk3
    install -D -m 644 $srcdir/files/main/mp_pakmaps6.pk3 $pkgdir/opt/wolf-data/mp_pakmaps6.pk3
    install -D -m 644 $srcdir/wolf-data-steam/Main/pak0.pk3 $pkgdir/opt/wolf-data/pak0.pk3
    install -D -m 644 $srcdir/wolf-data-steam/Main/sp_pak1.pk3 $pkgdir/opt/wolf-data/sp_pak1.pk3
    install -D -m 644 $srcdir/files/main/sp_pak2.pk3 $pkgdir/opt/wolf-data/sp_pak2.pk3
    install -D -m 644 $srcdir/files/main/sp_pak3.pk3 $pkgdir/opt/wolf-data/sp_pak3.pk3
    install -D -m 644 $srcdir/wolf-data-steam/Main/sp_pak4.pk3 $pkgdir/opt/wolf-data/sp_pak4.pk3
}

