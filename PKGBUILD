# Maintainer: Saeed Badrelden <helwanlinux@gmail.com.com>
pkgname=momo
pkgver=1.0.0
pkgrel=2
pkgdesc="Momo - Helwan Linux Diagnostics Tool (TUI + Streaming + Dynamic Disks)"
arch=('x86_64')
url="https://github.com/helwan-linux/momo"
license=('GPL')
depends=('python' 'lm_sensors' 'smartmontools' 'hdparm' 'nvme-cli' 'stress-ng' 'memtester' 'sysbench' 'fio' 'iperf3' 'mtr')
# 💡 التعديل 1: استخدام صيغة Git لسحب الكود مباشرة من المستودع
# 'git+' تخبر makepkg بأن هذا الرابط هو مستودع Git يجب استنساخه
source=("${pkgname}::git+${url}.git")

# 💡 التعديل 2: يجب استخدام 'SKIP' لأن الملفات المسحوبة من Git تتغير
# باستمرار، وبالتالي لا يمكن الاعتماد على تجزئة ثابتة.
sha256sums=('SKIP') 

package() {
    # 💡 التعديل 3: عند السحب من Git، يتم إنشاء مجلد فرعي باسم ${pkgname}
    # يجب الإشارة إلى الملف داخل هذا المجلد.
    # install -Dm755 "${srcdir}/${pkgname}/momo" "${pkgdir}/usr/bin/momo"
    
    # تأكد من تنفيذ chmod إذا كان الملف momo غير قابل للتنفيذ (755)
    chmod +x "${srcdir}/${pkgname}/momo"
    install -Dm755 "${srcdir}/${pkgname}/momo" "${pkgdir}/usr/bin/momo"
}
