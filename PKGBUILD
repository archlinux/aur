# Maintainer: Prasad Kumar
# Contributor: Philip Müller <philm@manjaro.org>
pkgname=ms-office-online
pkgver=18.04.1
pkgrel=1
pkgdesc="Microsoft Office Suite Online"
arch=('any')
url="https://github.com/manjaro/ms-office-online-launcher"
license=('GPL3')
depends=('jade-application-kit-git') #minimum of jade-application-kit v0.36 is required and is currently provided by git
source=("https://github.com/manjaro/ms-office-online-launcher/archive/${pkgver}.zip")
sha512sums=('8f4f444c0cf885fcff64c2c4316e9643da0257d627a439fb391231ddcff5921610ef7afe1b3eb01ef632a4529e07d5fc5f91e687ddc6f886251fa220dee1bccb')

package() {

    cd "${srcdir}"/ms-office-online-launcher-${pkgver}

    # Install ms-office-online launcher
    install -Dm755 ms-office-online "${pkgdir}"/usr/share/ms-office/msoffice/ms-office-online
    install -Dm755 ms-office-online "${pkgdir}"/usr/share/ms-office/powerpoint/ms-office-online
    install -Dm755 ms-office-online "${pkgdir}"/usr/share/ms-office/excel/ms-office-online
    install -Dm755 ms-office-online "${pkgdir}"/usr/share/ms-office/word/ms-office-online
    install -Dm755 ms-office-online "${pkgdir}"/usr/share/ms-office/outlook/ms-office-online
    install -Dm755 ms-office-online "${pkgdir}"/usr/share/ms-office/onenote/ms-office-online
    install -Dm755 ms-office-online "${pkgdir}"/usr/share/ms-office/webskype/ms-office-online
    
    # Install json settings
    install -Dm644 settings.json "${pkgdir}"/usr/share/ms-office/msoffice/settings.json
    install -Dm644 settings.json "${pkgdir}"/usr/share/ms-office/powerpoint/settings.json
    install -Dm644 settings.json "${pkgdir}"/usr/share/ms-office/excel/settings.json
    install -Dm644 settings.json "${pkgdir}"/usr/share/ms-office/word/settings.json
    install -Dm644 settings.json "${pkgdir}"/usr/share/ms-office/outlook/settings.json
    install -Dm644 settings.json "${pkgdir}"/usr/share/ms-office/onenote/settings.json
    install -Dm644 settings.json "${pkgdir}"/usr/share/ms-office/webskype/settings.json
    
    # Create binaries
    mkdir -p "${pkgdir}"/usr/bin

    echo "#!/bin/sh" > "${pkgdir}"/usr/bin/msoffice
    echo "cd /usr/share/ms-office/msoffice" >> "${pkgdir}"/usr/bin/msoffice
    echo "./ms-office-online" >> "${pkgdir}"/usr/bin/msoffice
    sed -i -e "s|_URL_|https://www.office.com/login?es=Click&ru=%2F|" "${pkgdir}"/usr/share/ms-office/msoffice/settings.json

    echo "#!/bin/sh" > "${pkgdir}"/usr/bin/powerpoint
    echo "cd /usr/share/ms-office/powerpoint" >> "${pkgdir}"/usr/bin/powerpoint
    echo "./ms-office-online" >> "${pkgdir}"/usr/bin/powerpoint
    sed -i -e "s|_URL_|https://office.live.com/start/PowerPoint.aspx|" "${pkgdir}"/usr/share/ms-office/powerpoint/settings.json

    echo "#!/bin/sh" > "${pkgdir}"/usr/bin/excel
    echo "cd /usr/share/ms-office/excel" >> "${pkgdir}"/usr/bin/excel
    echo "./ms-office-online" >> "${pkgdir}"/usr/bin/excel
    sed -i -e "s|_URL_|https://office.live.com/start/Excel.aspx|" "${pkgdir}"/usr/share/ms-office/excel/settings.json

    echo "#!/bin/sh" > "${pkgdir}"/usr/bin/word
    echo "cd /usr/share/ms-office/word" >> "${pkgdir}"/usr/bin/word
    echo "./ms-office-online" >> "${pkgdir}"/usr/bin/word
    sed -i -e "s|_URL_|https://office.live.com/start/Word.aspx|" "${pkgdir}"/usr/share/ms-office/word/settings.json

    echo "#!/bin/sh" > "${pkgdir}"/usr/bin/outlook
    echo "cd /usr/share/ms-office/outlook" >> "${pkgdir}"/usr/bin/outlook
    echo "./ms-office-online" >> "${pkgdir}"/usr/bin/outlook
    sed -i -e "s|_URL_|https://outlook.live.com/owa|" "${pkgdir}"/usr/share/ms-office/outlook/settings.json

    echo "#!/bin/sh" > "${pkgdir}"/usr/bin/onenote
    echo "cd /usr/share/ms-office/onenote" >> "${pkgdir}"/usr/bin/onenote
    echo "./ms-office-online" >> "${pkgdir}"/usr/bin/onenote
    sed -i -e "s|_URL_|https://www.onenote.com/notebooks|" "${pkgdir}"/usr/share/ms-office/onenote/settings.json

    echo "#!/bin/sh" > "${pkgdir}"/usr/bin/webskype
    echo "cd /usr/share/ms-office/webskype" >> "${pkgdir}"/usr/bin/webskype
    echo "./ms-office-online" >> "${pkgdir}"/usr/bin/webskype
    sed -i -e "s|_URL_|https://web.skype.com|" "${pkgdir}"/usr/share/ms-office/webskype/settings.json

    chmod a+x "${pkgdir}"/usr/bin/*

    # Configure json settings
    sed -i -e "s|_icon_|/usr/share/icons/ms-office/Office.png|" "${pkgdir}"/usr/share/ms-office/msoffice/settings.json
    sed -i -e "s|_icon_|/usr/share/icons/ms-office/PowerPoint.png|" "${pkgdir}"/usr/share/ms-office/powerpoint/settings.json
    sed -i -e "s|_icon_|/usr/share/icons/ms-office/Excel.png|" "${pkgdir}"/usr/share/ms-office/excel/settings.json
    sed -i -e "s|_icon_|/usr/share/icons/ms-office/Word.png|" "${pkgdir}"/usr/share/ms-office/word/settings.json
    sed -i -e "s|_icon_|/usr/share/icons/ms-office/Outlook.png|" "${pkgdir}"/usr/share/ms-office/outlook/settings.json
    sed -i -e "s|_icon_|/usr/share/icons/ms-office/OneNote.png|" "${pkgdir}"/usr/share/ms-office/onenote/settings.json
    sed -i -e "s|_icon_|/usr/share/icons/ms-office/Skype.png|" "${pkgdir}"/usr/share/ms-office/webskype/settings.json

    # Install icons
    install -Dm644 icons/Office.png "${pkgdir}"/usr/share/icons/ms-office/Office.png
    install -Dm644 icons/PowerPoint.png "${pkgdir}"/usr/share/icons/ms-office/PowerPoint.png
    install -Dm644 icons/Excel.png "${pkgdir}"/usr/share/icons/ms-office/Excel.png
    install -Dm644 icons/Word.png "${pkgdir}"/usr/share/icons/ms-office/Word.png
    install -Dm644 icons/Outlook.png "${pkgdir}"/usr/share/icons/ms-office/Outlook.png
    install -Dm644 icons/OneNote.png "${pkgdir}"/usr/share/icons/ms-office/OneNote.png
    install -Dm644 icons/Skype.png "${pkgdir}"/usr/share/icons/ms-office/Skype.png

    # Install desktop files
    install -Dm644 desktop-files/MSOffice.desktop "${pkgdir}"/usr/share/applications/MSOffice.desktop
    install -Dm644 desktop-files/PowerPoint.desktop "${pkgdir}"/usr/share/applications/PowerPoint.desktop
    install -Dm644 desktop-files/Excel.desktop "${pkgdir}"/usr/share/applications/Excel.desktop
    install -Dm644 desktop-files/Word.desktop "${pkgdir}"/usr/share/applications/Word.desktop
    install -Dm644 desktop-files/Outlook.desktop "${pkgdir}"/usr/share/applications/Outlook.desktop
    install -Dm644 desktop-files/OneNote.desktop "${pkgdir}"/usr/share/applications/OneNote.desktop
    install -Dm644 desktop-files/WebSkype.desktop "${pkgdir}"/usr/share/applications/WebSkype.desktop
}
