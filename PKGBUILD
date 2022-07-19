# Maintainer: Gabriel-Andrew Pollo-Guilbert <gabrielpolloguilbert@gmail.com>

pkgname=antidote
pkgver=10.6.3_B_40
pkgrel=1
pkgdesc='The most complete writing assistance software suite for English and French.'
arch=('x86_64')
url='https://www.antidote.info'
license=('custom')
source=(
    "Antidote_${pkgver}_Linux.tar.gz"
    'antidote.install'
)
md5sums=(
    '1197254ecc0c0f63cc453e5feca571ab'
    '4a84d8ffa4e4744bb6385a7d022d4f67'
)
options=(!strip)

package() {
    local srcdir="${srcdir}/Antidote_${pkgver}_Linux"

    mkdir -p "${pkgdir}/opt/Druide/"
    tar -xvf "${srcdir}/.bin/Antidote10.tar.xz"                 -C "${pkgdir}/opt/Druide/"
    tar -xvf "${srcdir}/.bin/Antidote10-Module-francais.tar.xz" -C "${pkgdir}/opt/Druide/"
    tar -xvf "${srcdir}/.bin/AssistantTelechargement.tar.bz2"   -C "${pkgdir}/opt/Druide/"
    tar -xvf "${srcdir}/.bin/Connectix10.tar.xz"                -C "${pkgdir}/opt/Druide/"
    ln -s '/opt/Druide/Utilitaires/AssistantTelechargement_v6/Bin64/AssistantTelechargement' \
        "${pkgdir}/opt/Druide/Utilitaires/AssistantTelechargement_v6/AssistantTelechargement"

    mkdir -p "${pkgdir}/usr/local/bin/"
    ln -s '/opt/Druide/Antidote10/Application/Bin/AgentAntidote'          "${pkgdir}/usr/local/bin/AgentAntidote"
    ln -s '/opt/Druide/Antidote10/Application/Bin/Antidote10'             "${pkgdir}/usr/local/bin/Antidote10"
    ln -s '/opt/Druide/Connectix10/Application/Bin/AgentConnectix'        "${pkgdir}/usr/local/bin/AgentConnectix10"
    ln -s '/opt/Druide/Connectix10/Application/Bin/AgentConnectixConsole' "${pkgdir}/usr/local/bin/AgentConnectixConsole10"
    ln -s '/usr/local/bin/AgentConnectix10'                               "${pkgdir}/usr/local/bin/AgentConnectix"
    ln -s '/usr/local/bin/AgentConnectixConsole10'                        "${pkgdir}/usr/local/bin/AgentConnectixConsole"
    ln -s '/usr/local/bin/Antidote10'                                     "${pkgdir}/usr/local/bin/Antidote"

    mkdir -p "${pkgdir}/usr/share/applications/"
    mv -v "${pkgdir}/opt/Druide/tmp/druide-agent-connectix-10.desktop"        "${pkgdir}/usr/share/applications/"
    mv -v "${pkgdir}/opt/Druide/tmp/druide-antidote-10-binaire.desktop"       "${pkgdir}/usr/share/applications/"
    mv -v "${pkgdir}/opt/Druide/tmp/druide-antidote-10-documentation.desktop" "${pkgdir}/usr/share/applications/"
    mv -v "${pkgdir}/opt/Druide/tmp/druide-antidote-10-dicoperso.desktop"     "${pkgdir}/usr/share/applications/"
    mv -v "${pkgdir}/opt/Druide/tmp/druide-antidote-10-favoris.desktop"       "${pkgdir}/usr/share/applications/"

    mkdir -p "${pkgdir}/usr/share/pixmaps/"
    mv -v "${pkgdir}/opt/Druide/tmp/antidote10.png"       "${pkgdir}/usr/share/pixmaps/"
    mv -v "${pkgdir}/opt/Druide/tmp/agentconnectix10.png" "${pkgdir}/usr/share/pixmaps/"

    mkdir -p "${pkgdir}/etc/xdg/autostart/"
    mv -v "${pkgdir}/opt/Druide/tmp/druide-agent-connectix-10-lancement-session.desktop" "${pkgdir}/etc/xdg/autostart/"

    mkdir -p "${pkgdir}/etc/chromium/native-messaging-hosts/" 
    cp -v "${pkgdir}/opt/Druide/tmp/googlechrome.com.druide.agentconnectixconsole.json" \
        "${pkgdir}/etc/chromium/native-messaging-hosts/com.druide.agentconnectixconsole.json"
    
    mkdir -p "${pkgdir}/etc/opt/chrome/native-messaging-hosts/"
    mv -v "${pkgdir}/opt/Druide/tmp/googlechrome.com.druide.agentconnectixconsole.json" \
        "${pkgdir}/etc/opt/chrome/native-messaging-hosts/com.druide.agentconnectixconsole.json"

    mkdir -p "${pkgdir}/usr/lib/mozilla/native-messaging-hosts/"
    cp -v "${pkgdir}/opt/Druide/tmp/firefox.com.druide.agentconnectixconsole.json" \
        "${pkgdir}/usr/lib/mozilla/native-messaging-hosts/com.druide.agentconnectixconsole.json"

    mkdir -p "${pkgdir}/usr/share/mime/packages/"
    mv -v "${pkgdir}/opt/Druide/tmp/druide-afav.xml" "${pkgdir}/usr/share/mime/packages/"
    mv -v "${pkgdir}/opt/Druide/tmp/druide-atq.xml"  "${pkgdir}/usr/share/mime/packages/"

    mkdir -p "${pkgdir}/usr/share/polkit-1/actions/"
    mv -v "${pkgdir}/opt/Druide/tmp/com.druide.pkexec.ConfigurateurSysteme.10.policy" \
        "${pkgdir}/usr/share/polkit-1/actions/"

    rm -v "${pkgdir}/opt/Druide/Antidote10/LingFR/rm.list"
    rm -v "${pkgdir}/opt/Druide/Antidote10/LingFR/rmFR.bash"
    rm -v "${pkgdir}/opt/Druide/Antidote10/rm.list"
    rm -v "${pkgdir}/opt/Druide/Antidote10/rmAntidote.bash"
    rm -v "${pkgdir}/opt/Druide/Connectix10/rm.list"
    rm -v "${pkgdir}/opt/Druide/Connectix10/rmConnectix.bash"
    rm -rfv "${pkgdir}/opt/Druide/tmp"
}

# MISSING FILES: /etc/dbus-1/system.d/antidote-mvi.conf
# MISSING FILES: /etc/dbus-1/system.d/antidote10.conf
# MISSING FILES: /etc/druide.conf
