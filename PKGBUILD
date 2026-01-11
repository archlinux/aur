# Maintainer: 0xMew <hacker@localhost>
pkgname=0xmew-toolkit
pkgver=3.6
pkgrel=1
pkgdesc="Advanced Network Attack Toolkit by 0xMew (ARP Spoof, Kill, SNI Spy)"
arch=('any')
url="https://github.com/0xMewhx/0xMew-toolkit"
license=('MIT')
depends=('python' 'tcpdump' 'ethtool' 'macchanger' 'python-scapy' 'python-cryptography' 'nmap' 'aircrack-ng' 'wireless_tools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
    cd "0xMew-toolkit-${pkgver}"

    # 1. Создаем папку в /opt/
    install -d "$pkgdir/opt/$pkgname"

    # 2. Копируем скрипт
    install -m755 wow.py "$pkgdir/opt/$pkgname/wow.py"

    # 3. Создаем лаунчер в /usr/bin/
    install -d "$pkgdir/usr/bin"

    # Пишем скрипт запуска прямо в пакет
    echo "#!/bin/bash" > "$pkgdir/usr/bin/$pkgname"
    echo "if [ \"\$EUID\" -ne 0 ]; then" >> "$pkgdir/usr/bin/$pkgname"
    echo "    exec sudo /usr/bin/python /opt/$pkgname/wow.py \"\$@\"" >> "$pkgdir/usr/bin/$pkgname"
    echo "else" >> "$pkgdir/usr/bin/$pkgname"
    echo "    exec /usr/bin/python /opt/$pkgname/wow.py \"\$@\"" >> "$pkgdir/usr/bin/$pkgname"
    echo "fi" >> "$pkgdir/usr/bin/$pkgname"

    # Делаем лаунчер исполняемым
    chmod 755 "$pkgdir/usr/bin/$pkgname"
}
