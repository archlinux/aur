# Maintainer: Your Name <your.email@example.com>
# Contributor: Laker <https://github.com/lakernote>

pkgname=easypostman
pkgver=4.3.12
pkgrel=1
pkgdesc="An open-source API debugging and stress testing tool inspired by Postman and JMeter"
arch=('x86_64')
url="https://github.com/lakernote/EasyPostman"
license=('Apache-2.0')
depends=('java-runtime>=17' 'hicolor-icon-theme')
makedepends=('maven' 'java-environment>=17')
optdepends=('git: for Git workspace functionality')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lakernote/EasyPostman/archive/refs/tags/v${pkgver}.tar.gz"
        "easypostman.desktop"
        "easypostman.sh")
sha256sums=('d5a6f78c1a05577e60c5f0dcf8d5e7197d792144099104ea549e41cdaa796486'
            'd643a4a9f8582150fe12404f97858327571b148935872295a226230d23dcac5d'
            'af25291994612c8b386069fea0499890a7b387a1004aa6586392f8e6a1e30054')

build() {
    cd "EasyPostman-${pkgver}"
    
    # 使用 Maven 构建项目
    mvn clean package -DskipTests
}

package() {
    cd "EasyPostman-${pkgver}"
    
    # 安装主 JAR 文件
    install -Dm644 "target/easy-postman-${pkgver}.jar" \
        "${pkgdir}/usr/share/java/${pkgname}/easypostman.jar"
    
    # 安装图标
    install -Dm644 "assets/linux/EasyPostman.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/easypostman.png"
    
    # 安装启动脚本
    install -Dm755 "${srcdir}/easypostman.sh" \
        "${pkgdir}/usr/bin/easypostman"
    
    # 安装 desktop 文件
    install -Dm644 "${srcdir}/easypostman.desktop" \
        "${pkgdir}/usr/share/applications/easypostman.desktop"
    
    # 安装许可证
    install -Dm644 "LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
