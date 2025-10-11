# Maintainer: 着火的冰块nya | zhdbk (https://zhdbk3.github.io)

pkgname=brother-dcpt735dw
pkgver=3.6.1
pkgrel=1
pkgdesc="Driver for Brother DCP-T735DW printer"
arch=("i686" "x86_64")
url="https://support.brother.com/g/b/downloadtop.aspx?c=cn&lang=zh&prod=dcpt735dw_eu_cn"
license=("EULA")
source=("https://d.brother-movie.com/driver/4210/dcpt735dwpdrv-3.6.1-1.x86_64.rpm")
md5sums=("05ea25d51abde2949218e54165b989b5")
depends=("cups")

package() {
    # Create necessary directory structure
    install -d "$pkgdir/opt/brother/Printers/dcpt735dw"
    install -d "$pkgdir/opt/brother/Printers/dcpt735dw/cupswrapper"
    install -d "$pkgdir/opt/brother/Printers/dcpt735dw/inf"
    install -d "$pkgdir/opt/brother/Printers/dcpt735dw/lpd"
    install -d "$pkgdir/opt/brother/Printers/dcpt735dw/lpd/i686"
    install -d "$pkgdir/opt/brother/Printers/dcpt735dw/lpd/x86_64"
    install -d "$pkgdir/usr/share/cups/model"
    install -d "$pkgdir/usr/share/licenses/$pkgname"
    install -d "$pkgdir/usr/lib/cups/filter"
    install -d "$pkgdir/usr/bin"

    # Install PPD file to CUPS model directory
    install -m644 "$srcdir/opt/brother/Printers/dcpt735dw/cupswrapper/brother_dcpt735dw_printer_en.ppd" \
        "$pkgdir/usr/share/cups/model/"

    # Install CUPS wrapper scripts
    install -m755 "$srcdir/opt/brother/Printers/dcpt735dw/cupswrapper/brother_lpdwrapper_dcpt735dw" \
        "$pkgdir/opt/brother/Printers/dcpt735dw/cupswrapper/"
    install -m755 "$srcdir/opt/brother/Printers/dcpt735dw/cupswrapper/cupswrapperdcpt735dw" \
        "$pkgdir/opt/brother/Printers/dcpt735dw/cupswrapper/"

    # Install INF files
    install -m755 "$srcdir/opt/brother/Printers/dcpt735dw/inf/brdcpt735dwfunc" \
        "$pkgdir/opt/brother/Printers/dcpt735dw/inf/"
    install -m755 "$srcdir/opt/brother/Printers/dcpt735dw/inf/brdcpt735dwrc" \
        "$pkgdir/opt/brother/Printers/dcpt735dw/inf/"
    install -m644 "$srcdir/opt/brother/Printers/dcpt735dw/inf/ImagingArea" \
        "$pkgdir/opt/brother/Printers/dcpt735dw/inf/"
    install -m644 "$srcdir/opt/brother/Printers/dcpt735dw/inf/PaperDimension" \
        "$pkgdir/opt/brother/Printers/dcpt735dw/inf/"
    install -m644 "$srcdir/opt/brother/Printers/dcpt735dw/inf/paperinfij2" \
        "$pkgdir/opt/brother/Printers/dcpt735dw/inf/"
    install -m755 "$srcdir/opt/brother/Printers/dcpt735dw/inf/setupPrintcapij" \
        "$pkgdir/opt/brother/Printers/dcpt735dw/inf/"

    # Install license files
    install -m644 "$srcdir/opt/brother/Printers/dcpt735dw/LICENSE_ENG.txt" \
        "$pkgdir/usr/share/licenses/$pkgname/"
    install -m644 "$srcdir/opt/brother/Printers/dcpt735dw/LICENSE_JPN.txt" \
        "$pkgdir/usr/share/licenses/$pkgname/"

    # Install LPD filters
    install -m755 "$srcdir/opt/brother/Printers/dcpt735dw/lpd/filter_dcpt735dw" \
        "$pkgdir/opt/brother/Printers/dcpt735dw/lpd/"

    # Install architecture-specific binaries
    if [ "$CARCH" = "x86_64" ]; then
        install -m755 "$srcdir/opt/brother/Printers/dcpt735dw/lpd/x86_64/brdcpt735dwfilter" \
            "$pkgdir/opt/brother/Printers/dcpt735dw/lpd/"
        install -m755 "$srcdir/opt/brother/Printers/dcpt735dw/lpd/x86_64/brprintconf_dcpt735dw" \
            "$pkgdir/opt/brother/Printers/dcpt735dw/lpd/"
    elif [ "$CARCH" = "i686" ]; then
        install -m755 "$srcdir/opt/brother/Printers/dcpt735dw/lpd/i686/brdcpt735dwfilter" \
            "$pkgdir/opt/brother/Printers/dcpt735dw/lpd/"
        install -m755 "$srcdir/opt/brother/Printers/dcpt735dw/lpd/i686/brprintconf_dcpt735dw" \
            "$pkgdir/opt/brother/Printers/dcpt735dw/lpd/"
    fi

    # Create necessary symbolic links
    ln -s /opt/brother/Printers/dcpt735dw/lpd/brdcpt735dwfilter \
        "$pkgdir/usr/lib/cups/filter/brdcpt735dw"
    ln -s /opt/brother/Printers/dcpt735dw/lpd/brprintconf_dcpt735dw \
        "$pkgdir/usr/bin/brprintconf_dcpt735dw"

    # Install CUPS wrapper script to executable path
    ln -s /opt/brother/Printers/dcpt735dw/cupswrapper/cupswrapperdcpt735dw \
        "$pkgdir/usr/bin/cupswrapperdcpt735dw"

    # FIX: Create missing symbolic link for brother_lpdwrapper_dcpt735dw
    ln -s /opt/brother/Printers/dcpt735dw/cupswrapper/brother_lpdwrapper_dcpt735dw \
        "$pkgdir/usr/lib/cups/filter/brother_lpdwrapper_dcpt735dw"
}